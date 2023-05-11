import OSLog
import JavaScriptCore

public actor Highlight {
    private var hljs: JSValue?
    private var styleName: String = ""
    private var styleText: String = ""
    private var styleRegex: Regex<AnyRegexOutput>?
    private var backgroundColor: String = ""

    private static let shared = Highlight()
    
    public static func text(_ text: String,
                            language: String? = nil,
                            styleName: String = "stackoverflow-light") async throws -> HighlightResult {
        try await shared.text(
            text,
            language: language,
            styleName: styleName
        )
    }
    
    private func text(_ text: String,
                      language: String?,
                      styleName: String) throws -> HighlightResult {
        let highlightResult: JSValue
        let hljs = try loadHLJSIfNeeded()
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
        let (styleText, backgroundColor) = try loadStyleIfNeeded(styleName)
        let attributedText = try attributed(value, styleText: styleText)
        let illegal = highlightResult.objectForKeyedSubscript("illegal").toBool()
        let relevance = highlightResult.objectForKeyedSubscript("relevance").toInt32()
        return HighlightResult(
            illegal: illegal,
            language: language,
            relevance: relevance,
            attributedText: attributedText,
            backgroundColorHex: backgroundColor
        )
    }

    private func loadFile(_ name: String,
                          type: String) throws -> String {
        let filePath = Bundle.module.path(forResource: name, ofType: type)
        guard let filePath else {
            throw HighlightError.fileNotFound
        }
        return try String(contentsOfFile: filePath)
    }
    
    //  MARK: - Highlight
    
    private func loadHLJSIfNeeded() throws -> JSValue {
        if let hljs {
            return hljs
        } else {
            guard let context = JSContext() else {
                throw HighlightError.contextNotFound
            }
            let scriptText = try loadFile("highlight.min", type: "js")
            context.evaluateScript(scriptText)
            if let hljs = context.objectForKeyedSubscript("hljs") {
                self.hljs = hljs
                return hljs
            } else {
                throw HighlightError.hljsNotFound
            }
        }
    }
    
    private func attributed(_ value: String, styleText: String) throws -> AttributedString {
        let data = "<style>"
            .appending(styleText)
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
    
    //  MARK: - Style

    private func loadStyleIfNeeded(_ name: String) throws -> (String, String) {
        if name != self.styleName {
            let (styleText, backgroundColor) = try loadStyle(name)
            self.styleName = name
            self.styleText = styleText
            self.backgroundColor = backgroundColor
            return (styleText, backgroundColor)
        } else {
            return (styleText, backgroundColor)
        }
    }
    
    private func loadStyle(_ name: String) throws -> (String, String) {
        let regex: Regex<AnyRegexOutput> = try loadStyleRegex()
        let text = try loadFile(name + ".min", type: "css")
        let matches = text.matches(of: regex.ignoresCase())
        var styleText = ""
        var backgroundColor: String = ""
        for match in matches where match.count == 3 {
            let properties = properties(from: text[match[2].range!])
            guard !properties.isEmpty else { continue }
            for selector in selectors(from: text[match[1].range!]) {
                var selectorText = ""
                for (property, value) in properties {
                    if property.lowercased() == "background" {
                        backgroundColor = value
                    }
                    if selector != ".hljs" || !(["background-color", "background"].contains(property.lowercased())) {
                        selectorText += "\(property):\(value);"
                    }
                }
                styleText += selector + "{" + selectorText + "}"
            }
        }
        return (styleText, backgroundColor)
    }

    private func loadStyleRegex() throws -> Regex<AnyRegexOutput> {
        let regex: Regex<AnyRegexOutput>
        if let styleRegex {
            regex = styleRegex
        } else {
            regex = try Regex("(?:(\\.[a-zA-Z0-9\\-_]*(?:[, ]\\.[a-zA-Z0-9\\-_]*)*)\\{([^\\}]*?)\\})")
            styleRegex = regex
        }
        return regex
    }

    private func properties(from text: Substring) -> [String: String] {
        let properties = text
            .components(separatedBy: ";")
            .compactMap { declaration -> (String, String)? in
                let components = declaration.components(separatedBy: ":")
                guard
                    let value = components.last,
                    let property = components.first
                else {
                    return nil
                }
                return (property, value)
            }
            .reduce(into: [String: String]()) { $0[$1.0] = $1.1 }
        return properties
    }

    private func selectors(from text: Substring) -> [String] {
        String(text)
            .replacingOccurrences(of: " ", with: ",")
            .components(separatedBy: ",")
            .map {
                $0.contains(".hljs-title")
                ? ($0.contains(".hljs-function")
                   ? "hljs-function-hljs-title"
                   : "hljs-class-hljs-title")
                : $0
            }
    }
}
