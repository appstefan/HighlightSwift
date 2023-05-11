import SwiftUI

public struct HighlightResult: Equatable {
    /// Syntax highlighted attributed text
    public let text: AttributedString
    /// Indicates if any illegal matches were found
    public let illegal: Bool
    /// Detected language name (or specified language)
    public let language: String
    /// Detected language relevance score
    public let relevance: Int32
    /// Background color
    public let backgroundColor: Color
    
    init(text: AttributedString,
         illegal: Bool,
         language: String,
         relevance: Int32,
         background: String) {
        self.text = text
        self.illegal = illegal
        self.language = language
        self.relevance = relevance
        self.backgroundColor = HighlightResult.color(background)
    }
    
    private static func color(_ hex: String) -> Color {
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
