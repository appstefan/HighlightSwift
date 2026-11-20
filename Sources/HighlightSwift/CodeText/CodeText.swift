import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
public struct CodeText {
    private let text: String
    
    internal var mode: HighlightMode = .automatic
    internal var style: CodeTextStyle = .plain
    internal var colors: CodeTextColors = .theme(.xcode)
    
    internal var success: ((HighlightResult) -> Void)?
    internal var failure: ((Error) -> Void)?
    internal var result: ((Result<HighlightResult, Error>) -> Void)?

    private let cachedResult: HighlightResult?
    @State private var highlightResult: HighlightResult?
    
    @Environment(\.highlight) internal var highlight
    @Environment(\.colorScheme) internal var colorScheme
    
    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: Plain text code to be syntax highlighted and displayed.
    ///   - result: Existing result to reuse when its source, mode, and colors match.
    public init(_ text: String, result: HighlightResult? = nil) {
        self.text = text
        self.cachedResult = result
    }
    
    var input: HighlightInput {
        HighlightInput(text: text, mode: mode, colors: colorScheme == .dark ? colors.dark : colors.light)
    }

    func currentResult(for input: HighlightInput) -> HighlightResult? {
        if highlightResult?.input == input { return highlightResult }
        return cachedResult?.input == input ? cachedResult : nil
    }

    @MainActor
    func highlightText(_ input: HighlightInput) async {
        guard !Task.isCancelled, currentResult(for: input) == nil else { return }
        do {
            let value = try await highlight.request(input.text, mode: input.mode, colors: input.colors)
            try Task.checkCancellation()
            highlightResult = value
            result?(.success(value))
            success?(value)
        } catch {
            guard !Task.isCancelled else { return }
            result?(.failure(error))
            failure?(error)
        }
    }
}
