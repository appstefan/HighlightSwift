import JavaScriptCore

final actor HLJS {
    private var hljs: JSValue?
    
    private func load() throws -> JSValue {
        if let hljs {
            return hljs
        }
        guard let context = JSContext() else {
            throw HLJSError.contextIsNil
        }
        let highlightPath = Bundle.module.path(forResource: "highlight.min", ofType: "js")
        guard let highlightPath else {
            throw HLJSError.fileNotFound
        }
        let highlightScript = try String(contentsOfFile: highlightPath, encoding: .utf8)
        context.evaluateScript(highlightScript)
        guard let hljs = context.objectForKeyedSubscript("hljs"), hljs.isObject else {
            throw HLJSError.hljsNotFound
        }
        self.hljs = hljs
        return hljs
    }
    
    func highlight(_ text: String, mode: HighlightMode) throws -> HLJSResult {
        try Task.checkCancellation()
        switch mode {
        case .automatic:
            return try highlightAuto(text)
        case .languageAlias(let alias):
            return try highlight(text, language: alias, ignoreIllegals: false)
        case .languageAliasIgnoreIllegal(let alias):
            return try highlight(text, language: alias, ignoreIllegals: true)
        case .language(let language):
            return try highlight(text, language: language.alias, ignoreIllegals: false)
        case .languageIgnoreIllegal(let language):
            return try highlight(text, language: language.alias, ignoreIllegals: true)
        }
    }
    
    private func highlightAuto(_ text: String) throws -> HLJSResult {
        let hljs = try load()
        let jsResult = hljs.invokeMethod(
            "highlightAuto",
            withArguments: [text]
        )
        // highlight.js 11.12 can rank Dart above Swift for SwiftUI views.
        // An unquoted SwiftUI import distinguishes these two candidates.
        if jsResult?.objectForKeyedSubscript("language")?.toString() == "dart",
           let runnerUp = jsResult?.objectForKeyedSubscript("secondBest"),
           runnerUp.objectForKeyedSubscript("language")?.toString() == "swift",
           text.range(of: #"(?m)^[ \t]*import[ \t]+SwiftUI[ \t]*$"#, options: .regularExpression) != nil {
            return try highlightResult(runnerUp)
        }
        return try highlightResult(jsResult)
    }
    
    private func highlight(_ text: String,
                           language: String,
                           ignoreIllegals: Bool) throws -> HLJSResult {
        var languageOptions: [String : Any] = [
            "language": language,
        ]
        if ignoreIllegals {
            languageOptions["ignoreIllegals"] = ignoreIllegals
        }
        let hljs = try load()
        guard hljs.invokeMethod("getLanguage", withArguments: [language])?.isObject == true else {
            return HLJSResult(value: nil, illegal: false, language: nil, relevance: 0)
        }
        let jsResult = hljs.invokeMethod(
            "highlight",
            withArguments: [text, languageOptions]
        )
        return try highlightResult(jsResult)
    }
    
    private func highlightResult(_ result: JSValue?) throws -> HLJSResult {
        guard let result, result.isObject,
              let value = result.objectForKeyedSubscript("value"), value.isString else {
            throw HLJSError.valueNotFound
        }
        let language = result.objectForKeyedSubscript("language")
        return HLJSResult(
            value: value.toString(),
            illegal: result.objectForKeyedSubscript("illegal").toBool(),
            language: language?.isString == true ? language?.toString() : nil,
            relevance: result.objectForKeyedSubscript("relevance").toInt32()
        )
    }
}
