@available(iOS 16.1, tvOS 16.1, *)
extension CodeText {
    /// Sets the a specific language for this code text.
    /// Disables automatic language detection mode.
    public func codeTextStyle<S>(_ style: S) -> CodeText where S : CodeTextStyle {
        var content = self
        content.style = style
        return content
    }
    
    /// Sets the language detection mode for this code text.
    /// See also: `codeTextLanguage(_:)` to directly apply `.language` mode.
    public func codeTextMode(_ mode: HighlightMode) -> CodeText {
        var content = self
        content.mode = mode
        return content
    }
    
    /// Sets the highlight color theme for this code text.
    public func codeTextColors(_ colors: CodeTextColors) -> CodeText {
        var content = self
        content.colors = colors
        return content
    }
    
    /// Sets the a specific language for this code text.
    /// Disables automatic language detection mode.
    public func codeTextLanguage(_ language: HighlightLanguage) -> CodeText {
        var content = self
        content.mode = .language(language)
        return content
    }
    
    /// Adds an action to perform after the text has been highlighted
    public func onHighlight(_ perform: @escaping ((Result<HighlightResult, Error>) -> Void)) -> CodeText {
        var content = self
        content.onHighlight = perform
        return content
    }
}
