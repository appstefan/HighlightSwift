import SwiftUI

public struct HighlightResult: Equatable {
    /// The syntax highlighted attributed text
    public let attributed: AttributedString
    /// Indicates wether any illegal matches were found
    public let illegal: Bool
    /// The language identifier
    public let language: String
    /// The language relevance score
    public let relevance: Int
    /// The language name for display
    public let languageName: String
    /// The highlight style background color
    public let backgroundColor: Color
    
    init(attributed: AttributedString,
         highlightJSResult: HighlightJSResult,
         backgroundColorHex: String) {
        self.attributed = attributed
        self.illegal = highlightJSResult.illegal
        self.language = highlightJSResult.language
        self.relevance = Int(highlightJSResult.relevance)
        self.languageName = HighlightResult.languageName(highlightJSResult)
        self.backgroundColor = HighlightResult.backgroundColor(backgroundColorHex)
    }
    
    private static func languageName(_ result: HighlightJSResult) -> String {
        let name: String
        switch result.language {
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
            name = result.language.uppercased()
        default:
            name = result.language.capitalized
        }
        return name + (result.relevance <= 5 ? "?" : "")
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
        func rgba(_ value: UInt64) -> Double {
            Double(value) / 255
        }
        return Color(.sRGB, red: rgba(r), green: rgba(g), blue:  rgba(b), opacity: rgba(a))
    }
}
