import JavaScriptCore

public actor Highlight {
    private var hljs: JSValue?
    private static let shared = Highlight()
    
    /// Attempts to syntax highlight the specified text.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The language to use (default: automatic).
    ///   - ignoreIllegals: Whether to ignore illegal matches (default: false).
    ///   - style: The highlight color style to use (default: .xcode/.light).
    /// - Throws: Either a HighlightError or an Error.
    /// - Returns: The result of the syntax highlight.
    public static func text(_ text: String,
                            language: String? = nil,
                            ignoreIllegals: Bool? = nil,
                            style: HighlightStyle = .dark(.xcode)) async throws -> HighlightResult {
        try await shared.highlight(
            text,
            language: language,
            ignoreIllegals: ignoreIllegals,
            style: style
        )
    }
    
    private func highlight(_ text: String,
                           language: String?,
                           ignoreIllegals: Bool?,
                           style: HighlightStyle) throws -> HighlightResult {
        let hljsResult = try highlightJS(
            text: text,
            language: language,
            ignoreIllegals: ignoreIllegals
        )
        let data = try htmlData(
            text: hljsResult.value,
            selectors: style.selectorsText
        )
        let attributed = try attributedText(data)
        let result = HighlightResult(
            attributed: attributed,
            highlightJSResult: hljsResult,
            backgroundColorHex: style.backgroundHex
        )
        return result
    }
    
    private func highlightJS(text: String,
                             language: String?,
                             ignoreIllegals: Bool?) throws -> HighlightJSResult {
        let hljs = try loadHLJS()
        var highlightArguments: [Any] = [text]
        var highlightFunction: String = "highlightAuto"
        if let language {
            highlightFunction = "highlight"
            var highlightOptions: [String: Any] = ["language": language]
            if let ignoreIllegals {
                highlightOptions["ignoreIllegals"] = ignoreIllegals
            }
            highlightArguments.append(highlightOptions)
        }
        let highlightResult = hljs.invokeMethod(highlightFunction, withArguments: highlightArguments)
        guard let highlightResult else {
            throw HighlightError.valueNotFound
        }
        let illegal = highlightResult.objectForKeyedSubscript("illegal").toBool()
        let relevance = highlightResult.objectForKeyedSubscript("relevance").toInt32()
        guard
            let value = highlightResult.objectForKeyedSubscript("value").toString(),
            let language = highlightResult.objectForKeyedSubscript("language").toString()
        else {
            throw HighlightError.valueNotFound
        }
        return HighlightJSResult(
            value: value,
            illegal: illegal,
            language: language,
            relevance: relevance
        )
    }
    
    private func loadHLJS() throws -> JSValue {
        if let hljs {
            return hljs
        }
        guard let context = JSContext() else {
            throw HighlightError.contextIsNil
        }
        let highlightFilePath = Bundle.module.path(
            forResource: "highlight.min",
            ofType: "js"
        )
        guard let highlightFilePath else {
            throw HighlightError.fileNotFound
        }
        let highlightScript = try String(contentsOfFile: highlightFilePath)
        context.evaluateScript(highlightScript)
        guard let hljs = context.objectForKeyedSubscript("hljs") else {
            throw HighlightError.hljsNotFound
        }
        self.hljs = hljs
        return hljs
    }
    
    private func htmlData(text: String, selectors: String) throws -> Data {
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
    
    private func attributedText(_ data: Data) throws -> AttributedString {
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
