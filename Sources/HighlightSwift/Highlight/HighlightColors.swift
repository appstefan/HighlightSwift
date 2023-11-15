import SwiftUI

/// Provides CSS text and background colors based on the highlight theme and system color scheme.
public struct HighlightColors: Hashable {
    let theme: HighlightTheme
    let colorScheme: ColorScheme
    let selectorsText: String
    let backgroundHex: String
    
    public static func dark(_ theme: HighlightTheme) -> HighlightColors {
        HighlightColors(theme: theme, colorScheme: .dark)
    }
    
    public static func light(_ theme: HighlightTheme) -> HighlightColors {
        HighlightColors(theme: theme, colorScheme: .light)
    }
    
    public init(theme: HighlightTheme,
                colorScheme: ColorScheme) {
        self.theme = theme
        self.colorScheme = colorScheme
        switch colorScheme {
        case .light:
            self.selectorsText = String(describing: HighlightCSS.light(theme))
            self.backgroundHex = String(describing: HighlightBackground.light(theme))
        case .dark:
            self.selectorsText = String(describing: HighlightCSS.dark(theme))
            self.backgroundHex = String(describing: HighlightBackground.dark(theme))
        @unknown default:
            self.selectorsText = ""
            self.backgroundHex = ""
        }
    }
}
