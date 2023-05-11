import SwiftUI

public enum HighlightStyle: String, CaseIterable, Identifiable, Equatable {
    case a11y
    case atomOne = "atom-one"
    case classic
    case edge
    case github
    case google
    case gradient
    case grayscale
    case harmonic16
    case heetch
    case horizon
    case humanoid
    case ia
    case isblEditor = "isbl-editor"
    case kimbie
    case nnfx
    case pandaSyntax = "panda-syntax"
    case papercolor
    case paraiso
    case qtcreator
    case silk
    case solarFlare = "solar-flare"
    case solarized
    case stackoverflow
    case standard
    case summerfruit
    case synthMidnightTerminal = "synth-midnight-terminal"
    case tokyoNight = "tokyo-night"
    case unikitty
    case xcode
    
    public var id: String {
        rawValue
    }
    
    var displayName: String {
        rawValue
            .replacingOccurrences(of: "-", with: " ")
            .capitalized
    }
    
    func name(_ colorScheme: ColorScheme) -> String {
        switch colorScheme {
        case .dark:
            return rawValue + "-dark"
        case .light:
            return rawValue + "-light"
        @unknown default:
            return rawValue + "-light"
        }
    }
}
