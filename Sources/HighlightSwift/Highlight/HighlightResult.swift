import SwiftUI

public struct HighlightResult: Equatable {
  /// The syntax highlighted attributed text
  public let attributed: AttributedString
  /// The highlight style background color
  public let backgroundColor: Color
  
  init(attributed: AttributedString,
       backgroundColorHex: String) {
    self.attributed = attributed
    self.backgroundColor = HighlightResult.backgroundColor(backgroundColorHex)
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
