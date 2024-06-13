import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
public struct CodeText {
    private let text: String
    
    internal var mode: HighlightMode = .automatic
    internal var style: CodeTextStyle = .plain
    internal var colors: CodeTextColors = .theme(.xcode)
    internal var onHighlight: ((Result<HighlightResult, Error>) -> Void)?
    
    @State internal var highlight = Highlight()
    @State internal var highlightTask: Task<Void, Never>?
    @State internal var highlightResult: HighlightResult?
    
    @Environment(\.colorScheme) internal var colorScheme
    
    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: Plain text code to be syntax highlighted and shown.
    public init(_ text: String) {
        self.text = text
    }
    
    internal var attributedText: AttributedString {
        highlightResult?.attributedText ?? AttributedString(stringLiteral: text)
    }
    
    @MainActor
    internal func highlightText(
        mode: HighlightMode? = nil,
        colors: CodeTextColors? = nil,
        colorScheme: ColorScheme? = nil) 
    async {
        let text = self.text
        let mode = mode ?? self.mode
        let colors = colors ?? self.colors
        let scheme = colorScheme ?? self.colorScheme
        let schemeColors = scheme == .dark ? colors.dark : colors.light
        do {
            let result = try await highlight.request(text, mode: mode, colors: schemeColors)
            highlightResult = result
            onHighlight?(.success(result))
        } catch {
            onHighlight?(.failure(error))
        }
    }
}
