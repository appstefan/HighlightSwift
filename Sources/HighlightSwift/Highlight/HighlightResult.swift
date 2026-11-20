import SwiftUI

/// The result of a call to Highlight
public struct HighlightResult: Equatable, Sendable {
    /// The syntax highlighted attributed text
    public let attributedText: AttributedString
    
    /// The syntax highlight failed
    public let isUndefined: Bool
    
    /// Illegal matches were found
    public let hasIllegal: Bool
    
    /// The language identifier
    public let language: String
    
    /// The language relevance score
    public let relevance: Int
    
    /// The language name with a question mark if relevance is low. e.g. "Python?", "Swift" or "C++"
    public let languageName: String
    
    /// The highlight style background color
    public let backgroundColor: Color
    
    let input: HighlightInput

    init(attributedText: AttributedString,
         highlightJSResult: HLJSResult,
         input: HighlightInput) {
        self.input = input
        self.attributedText = attributedText
        self.hasIllegal = highlightJSResult.illegal
        self.language = highlightJSResult.language ?? "unknown"
        self.relevance = Int(highlightJSResult.relevance)
        self.isUndefined = highlightJSResult.value == nil
        self.languageName = HighlightResult.languageName(highlightJSResult)
        self.backgroundColor = HighlightResult.backgroundColor(input.colors.background)
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.attributedText == rhs.attributedText &&
            lhs.isUndefined == rhs.isUndefined &&
            lhs.hasIllegal == rhs.hasIllegal &&
            lhs.language == rhs.language &&
            lhs.relevance == rhs.relevance &&
            lhs.languageName == rhs.languageName &&
            lhs.backgroundColor == rhs.backgroundColor
    }

    private static func languageName(_ result: HLJSResult) -> String {
        guard let language = result.language else { return "Unknown" }
        let name: String
        switch language {
        case "xml": name = "HTML"
        case "cpp": name = "C++"
        case "csharp": name = "C#"
        case "graphql": name = "GraphQL"
        case "pgsql": name = "PostgreSQL"
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
