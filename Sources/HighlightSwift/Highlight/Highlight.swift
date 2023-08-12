import JavaScriptCore

public actor Highlight {
  private var hljs: JSValue?
  private static let shared = Highlight()
  
  /// Attempts to syntax highlight the specified text.
  /// - Parameters:
  ///   - text: The plain text code to highlight.
  ///   - language: The language to use (default: automatic).
  ///   - style: The highlight color style to use (default: .xcode/.light).
  /// - Throws: Either a HighlightError or an Error.
  /// - Returns: The result of the syntax highlight.
  public static func text(_ text: String,
                          language: HighlightStyle.Language,
                          style: HighlightStyle = .light) async throws -> HighlightResult {
    try await shared.highlight(
      text,
      language: language,
      style: style
    )
  }
  
  private func highlight(_ text: String,
                         language: HighlightStyle.Language,
                         style: HighlightStyle) throws -> HighlightResult {
    let hljsResult = try highlightJS(
      text: text,
      language: language
    )
    let data = try htmlData(
      text: hljsResult,
      selectors: style.selectorsText
    )
    let attributed = try attributedText(data)
    let result = HighlightResult(
      attributed: attributed,
      backgroundColorHex: String(describing: style.backgroundHex)
    )
    return result
  }
  
  private func highlightJS(text: String,
                           language: HighlightStyle.Language) throws -> String {
    let hljs = try loadHLJS()
    var highlightArguments: [Any] = [text]
    let highlightFunction: String = "highlight"
    var highlightOptions: [String: Any] = ["language": language.id]
    highlightOptions["ignoreIllegals"] = false
    highlightArguments.append(highlightOptions)
    let highlightResult = hljs.invokeMethod(highlightFunction, withArguments: highlightArguments)
    guard let highlightResult else {
      throw HighlightError.valueNotFound
    }
    guard let value = highlightResult.objectForKeyedSubscript("value").toString() else {
      throw HighlightError.valueNotFound
    }
    return value
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
