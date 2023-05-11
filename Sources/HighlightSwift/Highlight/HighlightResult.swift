import SwiftUI

public struct HighlightResult: Equatable {
    /// Whether any illegal matches were found
    public let illegal: Bool
    /// Detected language name (or specified language)
    public let language: String
    /// The relevance score
    public let relevance: Int32
    /// The syntax highlighted attributed text
    public let attributedText: AttributedString
    
    public let backgroundColorHex: String
    
    public var backgroundColor: Color {
        var int: UInt64 = 0
        let hex = backgroundColorHex.trimmingCharacters(in: .alphanumerics.inverted)
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
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
