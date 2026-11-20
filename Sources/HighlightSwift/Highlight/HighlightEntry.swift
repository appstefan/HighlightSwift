import SwiftUI

private enum HighlightKey: EnvironmentKey {
    static let defaultValue = Highlight()
}

extension EnvironmentValues {
    var highlight: Highlight {
        get { self[HighlightKey.self] }
        set { self[HighlightKey.self] = newValue }
    }
}
