public struct CodeTextColors: Equatable {
    public let dark: HighlightColors
    public let light: HighlightColors
    
    public static func theme(_ theme: HighlightTheme) -> CodeTextColors {
        CodeTextColors(dark: .dark(theme), light: .light(theme))
    }
    
    public static func custom(dark: HighlightColors, light: HighlightColors) -> CodeTextColors {
        CodeTextColors(dark: dark, light: light)
    }
}
