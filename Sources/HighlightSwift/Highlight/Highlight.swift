import OSLog
import JavaScriptCore

public actor Highlight {
    private var hljs: JSValue?
    private static let shared = Highlight()
    
    public static func text(_ text: String,
                            language: String? = nil,
                            style: HighlightStyle = HighlightStyle(.stackoverflow)) async throws -> HighlightResult {
        try await shared.text(text, language: language, style: style)
    }
    
    private func text(_ text: String,
                      language: String?,
                      style: HighlightStyle) throws -> HighlightResult {
        let highlightResult: JSValue
        let hljs = try loadIfNeeded()
        highlightResult = hljs.invokeMethod(
            language != nil ? "highlight" : "highlightAuto",
            withArguments: [text] + (language != nil ? [["language": language]] : [])
        )
        guard
            let value = highlightResult.objectForKeyedSubscript("value").toString(),
            let language = highlightResult.objectForKeyedSubscript("language").toString()
        else {
            throw HighlightError.valueNotFound
        }
        let attributedText = try attributed(value, selectors: style.selectorsText)
        let illegal = highlightResult.objectForKeyedSubscript("illegal").toBool()
        let relevance = highlightResult.objectForKeyedSubscript("relevance").toInt32()
        return HighlightResult(
            text: attributedText,
            illegal: illegal,
            language: language,
            relevance: relevance,
            background: style.backgroundHex
        )
    }
   
    private func loadIfNeeded() throws -> JSValue {
        if let hljs {
            return hljs
        } else {
            guard let context = JSContext() else {
                throw HighlightError.contextNotFound
            }
            guard let highlightFilePath = Bundle.module.path(forResource: "highlight.min", ofType: "js") else {
                throw HighlightError.fileNotFound
            }
            context.evaluateScript(try String(contentsOfFile: highlightFilePath))
            guard let hljs = context.objectForKeyedSubscript("hljs") else {
                throw HighlightError.hljsNotFound
            }
            self.hljs = hljs
            return hljs
        }
    }
    
    private func attributed(_ value: String,
                            selectors: String) throws -> AttributedString {
        let data = "<style>"
            .appending(selectors)
            .appending("</style>")
            .appending("<pre><code class=\"hljs\">")
            .appending(value.trimmingCharacters(in: .whitespacesAndNewlines))
            .appending("</code></pre>")
            .data(using: .utf8)
        guard let data else {
            throw HighlightError.dataNotEncodable
        }
        let nsAttributedString = try NSMutableAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
        let range = NSMakeRange(0, nsAttributedString.length)
        nsAttributedString.removeAttribute(.font, range: range)
#if os(macOS)
        return try AttributedString(nsAttributedString, including: \.appKit)
#else
        return try AttributedString(nsAttributedString, including: \.uiKit)
#endif
    }
}
