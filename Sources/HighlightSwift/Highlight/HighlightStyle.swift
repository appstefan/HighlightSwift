import SwiftUI

public struct HighlightStyle {
    public let name: Name
    public let colorScheme: ColorScheme
    
    let selectorsText: String
    let backgroundHex: String
    
    public static func dark(_ name: Name) -> HighlightStyle {
        HighlightStyle(
            name: name,
            colorScheme: .dark
        )
    }
    
    public static func light(_ name: Name) -> HighlightStyle {
        HighlightStyle(
            name: name,
            colorScheme: .light
        )
    }
    
    public init(name: Name,
                colorScheme: ColorScheme) {
        self.name = name
        self.colorScheme = colorScheme
        switch colorScheme {
        case .light:
            self.selectorsText = String(describing: Selectors.light(name))
            self.backgroundHex = String(describing: Background.light(name))
        case .dark:
            self.selectorsText = String(describing: Selectors.dark(name))
            self.backgroundHex = String(describing: Background.dark(name))
        @unknown default:
            self.selectorsText = ""
            self.backgroundHex = ""
        }
    }
}
