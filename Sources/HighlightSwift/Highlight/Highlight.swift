import Foundation

public final class Highlight: Sendable {
    private let hljs = HLJS()
    
    public init() { }
    
    /// Syntax highlight some text with automatic language detection.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributedText(_ text: String,
                               colors: HighlightColors = .light(.xcode)) async throws -> AttributedString {
        try await request(text, mode: .automatic, colors: colors).attributedText
    }
    
    /// Syntax highlight some text with a specific language.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The supported language to use.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributedText(_ text: String,
                               language: HighlightLanguage,
                               colors: HighlightColors = .light(.xcode)) async throws -> AttributedString {
        try await request(text, mode: .language(language), colors: colors).attributedText
    }
    
    /// Syntax highlight some text with a specific language.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The language alias to use.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributedText(_ text: String,
                               language: String,
                               colors: HighlightColors = .light(.xcode)) async throws -> AttributedString {
        try await request(text, mode: .languageAlias(language), colors: colors).attributedText
    }
    
    /// Syntax highlight some text and return detailed results.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - mode: The highlight mode to use (default: .automatic).
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: The result of the syntax highlight.
    public func request(_ text: String,
                        mode: HighlightMode = .automatic,
                        colors: HighlightColors = .light(.xcode)) async throws -> HighlightResult {
        let input = HighlightInput(text: text, mode: mode, colors: colors)
        let hljsResult = try await hljs.highlight(text, mode: mode)
        try Task.checkCancellation()
        let attributedText: AttributedString
        if let markup = hljsResult.value, !text.isEmpty {
            // HTML parsing normalizes literal CR and CRLF line endings.
            let code = markup.replacingOccurrences(of: "\r", with: "&#13;")
            let html = "<style>\(colors.css)</style><pre><code class=\"hljs\">\(code)</code></pre>"
            attributedText = try await attributedTextFromData(Data(html.utf8), source: text)
            try Task.checkCancellation()
        } else {
            attributedText = AttributedString(text)
        }
        return HighlightResult(attributedText: attributedText, highlightJSResult: hljsResult, input: input)
    }

    @MainActor
    private func attributedTextFromData(_ data: Data, source: String) throws -> AttributedString {
        try Task.checkCancellation()
        let imported = try NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )

        // The importer may append a paragraph break or omit content hidden by custom CSS.
        // Only take a styled range when it contains the exact original text.
        guard imported.string.utf8.starts(with: source.utf8) else {
            return AttributedString(source)
        }
        let range = NSRange(location: 0, length: source.utf16.count)
        imported.removeAttribute(.font, range: range)
        let attributedString = imported.attributedSubstring(from: range)
#if os(macOS)
        return try AttributedString(attributedString, including: \.appKit)
#else
        return try AttributedString(attributedString, including: \.uiKit)
#endif
    }
}

struct HighlightInput: Equatable, Sendable {
    let text: String
    let mode: HighlightMode
    let colors: HighlightColors

    static func == (lhs: Self, rhs: Self) -> Bool {
        // Swift strings can compare equal even when their source code units differ.
        lhs.mode == rhs.mode && lhs.colors == rhs.colors && lhs.text.utf8.elementsEqual(rhs.text.utf8)
    }
}
