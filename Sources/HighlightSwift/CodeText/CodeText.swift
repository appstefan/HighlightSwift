import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
public struct CodeText {
    private let text: String
    
    internal var mode: HighlightMode = .automatic
    internal var style: CodeTextStyle = .plain
    internal var colors: CodeTextColors = .theme(.xcode)
    internal var font: PlatformFont?

    internal var success: ((HighlightResult) -> Void)?
    internal var failure: ((Error) -> Void)?
    internal var result: ((Result<HighlightResult, Error>) -> Void)?

    @State internal var highlightTask: Task<Void, Never>?
    @State internal var highlightResult: HighlightResult?
    
    @Environment(\.highlight) internal var highlight
    @Environment(\.colorScheme) internal var colorScheme
    
    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: Plain text code to be syntax highlighted and displayed.
    ///   - result: Existing highlight result to display instead of highlighting the text on appear.
    public init(_ text: String, result: HighlightResult? = nil) {
        self.text = text
        self._highlightResult = .init(initialValue: result)
    }
    
    internal var attributedText: AttributedString {
        var attributedText = highlightResult?.attributedText ?? AttributedString(stringLiteral: text)
        if let font {
            attributedText.font = font
        }
        return attributedText
    }

    internal var fontDesign: Font.Design? {
        if font == nil {
            return .monospaced
        } else {
            return nil
        }
    }

    @MainActor
    internal func highlightText(
        mode: HighlightMode? = nil,
        colors: CodeTextColors? = nil,
        colorScheme: ColorScheme? = nil
    ) async {
        let text = self.text
        let mode = mode ?? self.mode
        let colors = colors ?? self.colors
        let scheme = colorScheme ?? self.colorScheme
        let schemeColors = scheme == .dark ? colors.dark : colors.light
        do {
            let highlightResult = try await highlight.request(text, mode: mode, colors: schemeColors)
            self.highlightResult = highlightResult
            result?(.success(highlightResult))
            success?(highlightResult)
        } catch {
            result?(.failure(error))
            failure?(error)
        }
    }
}
