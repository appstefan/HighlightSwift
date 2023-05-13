import SwiftUI

public struct HighlightResult: Equatable {
    /// The syntax highlighted attributed text
    public let text: AttributedString
    /// Indicates that one or more illegal matches were found
    public let illegal: Bool
    /// The detected language identifier
    public let language: String
    /// The detected language relevance score
    public let relevance: Int
    /// The detected language name
    public let languageName: String
    /// The styled background color
    public let backgroundColor: Color
    
    init(text: AttributedString,
         illegal: Bool,
         language: String,
         relevance: Int,
         background: String) {
        self.text = text
        self.illegal = illegal
        self.language = language
        self.relevance = relevance
        self.languageName = HighlightResult.languageName(language, relevance: relevance)
        self.backgroundColor = HighlightResult.backgroundColor(background)
    }
    
    private static func languageName(_ language: String, relevance: Int) -> String {
        let name: String
        switch language {
        case "xml": name = "HTML"
        case "cpp": name = "C++"
        case "csharp": name = "C#"
        case "graphql": name = "GraphQL"
        case "javascript": name = "JavaScript"
        case "typescript": name = "TypeScript"
        case "objectivec": name = "Objective-C"
        case "vbnet": name = "Visual Basic .NET"
        case "php-template": name = "PHP Template"
        case "css", "sql", "json", "php", "scss", "toml", "yaml", "wasm":
            name = language.uppercased()
        default:
            name = language.capitalized
        }
        return name + (relevance <= 5 ? "?" : "")
    }
    
    private static func backgroundColor(_ hex: String) -> Color {
        var int: UInt64 = 0
        let hexString = hex.trimmingCharacters(in: .alphanumerics.inverted)
        Scanner(string: hexString).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hexString.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:(a, r, g, b) = (1, 1, 1, 0)
        }
        return Color(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
