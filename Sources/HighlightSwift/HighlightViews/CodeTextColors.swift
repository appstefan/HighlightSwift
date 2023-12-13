public struct CodeTextColors: Equatable {
    public let dark: HighlightColors
    public let light: HighlightColors
    
    public static func theme(_ theme: HighlightTheme) -> CodeTextColors {
        CodeTextColors(
            dark: HighlightColors(
                css: HighlightCSS.dark(theme),
                background: HighlightBackground.dark(theme)
            ),
            light: HighlightColors(
                css: HighlightCSS.light(theme),
                background: HighlightBackground.light(theme)
            )
        )
    }
    
    public static func custom(dark: HighlightColors, light: HighlightColors) -> CodeTextColors {
        CodeTextColors(dark: dark, light: light)
    }
}
