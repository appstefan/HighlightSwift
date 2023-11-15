import Foundation
import OrderedCollections

public actor Highlight {
    private var hljs: HLJS?
    private var cache: OrderedDictionary<Int, HighlightResult> = [:]
    private var cacheLimit: Int = 50
    
    public init(cacheLimit: Int = 50) {
        self.cacheLimit = cacheLimit
    }
    
    /// Syntax highlight some text with automatic language detection.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributed(_ text: String,
                           colors: HighlightColors = .light(.xcode)) throws -> AttributedString {
        try request(text, mode: .automatic, colors: colors).attributedText
    }
    
    /// Syntax highlight some text with a specific language.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The supported language to use.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributed(_ text: String,
                           language: HighlightLanguage,
                           colors: HighlightColors = .light(.xcode)) throws -> AttributedString {
        try request(text, mode: .language(language), colors: colors).attributedText
    }
    
    /// Syntax highlight some text with a specific language.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The language alias to use.
    ///   - colors: The highlight colors to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: A syntax highlighted attributed string.
    public func attributed(_ text: String,
                           language: String,
                           colors: HighlightColors = .light(.xcode)) throws -> AttributedString {
        try request(text, mode: .languageAlias(language), colors: colors).attributedText
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
                        colors: HighlightColors = .light(.xcode)) throws -> HighlightResult {
        guard cacheLimit > 0 else {
            return try hljsRequest(text, mode: mode, colors: colors)
        }
        var hasher = Hasher()
        hasher.combine(text)
        hasher.combine(mode)
        hasher.combine(colors)
        let hashValue = hasher.finalize()
        if let result = cache[hashValue] {
            return result
        } else {
            let result = try hljsRequest(text, mode: mode, colors: colors)
            let cacheCount = cache.count
            if cacheCount + 1 > cacheLimit {
                cache.removeFirst(cacheCount - cacheLimit)
            }
            cache[hashValue] = result
            return result
        }
    }
    
    private func hljsRequest(_ text: String,
                             mode: HighlightMode,
                             colors: HighlightColors) throws -> HighlightResult {
        let hljs = try hljs ?? HLJS()
        let hljsResult = try hljs.highlight(text, mode: mode)
        let isUndefined = hljsResult.value == "undefined"
        let attributedText: AttributedString
        if isUndefined {
            attributedText = AttributedString(stringLiteral: text)
        } else {
            let data = try htmlDataFromText(hljsResult.value, selectors: colors.selectorsText)
            attributedText = try attributedTextFromData(data)
        }
        return HighlightResult(
            attributedText: attributedText,
            highlightJSResult: hljsResult,
            backgroundColorHex: colors.backgroundHex
        )
    }

    private func htmlDataFromText(_ text: String, selectors: String) throws -> Data {
        let html = "<style>\n"
            .appending(selectors)
            .appending("\n</style>")
            .appending("\n<pre><code class=\"hljs\">")
            .appending(text.trimmingCharacters(in: .whitespacesAndNewlines))
            .appending("</code></pre>")
        guard let data = html.data(using: .utf8) else {
            throw HighlightError.dataEncoding
        }
        return data
    }
    
    private func attributedTextFromData(_ data: Data) throws -> AttributedString {
        let mutableString = try NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
        mutableString.removeAttribute(
            .font,
            range: NSMakeRange(0, mutableString.length)
        )
        let range = NSRange(location: 0, length: mutableString.length - 1)
        let attributedString = mutableString.attributedSubstring(from: range)
#if os(macOS)
        return try AttributedString(attributedString, including: \.appKit)
#else
        return try AttributedString(attributedString, including: \.uiKit)
#endif
    }
}
