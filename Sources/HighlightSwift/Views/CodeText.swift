import SwiftUI

@available(iOS 16.1, *)
public struct CodeText: View {
    @Environment(\.colorScheme)
    var colorScheme
    
    @State
    var highlightTask: Task<Void, Never>?
    
    @State
    var highlightResult: HighlightResult?
    
    @State
    var errorText: String?
    
    let text: String
    let language: String?
    let styleName: HighlightStyle.Name
    let showBackground: Bool
    let onHighlightResult: ((HighlightResult) -> Void)?

    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - style: The highlight color style to use (default: .stackoverflow).
    ///   - language: The language to use (default: nil/automatic).
    ///   - showBackground: Show the background of the highlight color style (default: false).
    ///   - onHighlightResult: Callback with the result of the syntax highlight (default: nil).
    public init(_ text: String,
                style: HighlightStyle.Name = .stackoverflow,
                language: String? = nil,
                showBackground: Bool = false,
                onHighlightResult: ((HighlightResult) -> Void)? = nil) {
        self.text = text
        self.styleName = style
        self.language = language
        self.showBackground = showBackground
        self.onHighlightResult = onHighlightResult
    }
    
    public var body: some View {
        ZStack {
            if let highlightResult {
                Text(highlightResult.text)
                    .padding(.bottom, -16)
            } else {
                Text(text)
            }
        }
        .fontDesign(.monospaced)
        .padding(showBackground ? 8 : 0)
        .background {
            if
                showBackground,
                let highlightResult {
                Rectangle()
                    .fill(highlightResult.backgroundColor)
            }
        }
        .task {
            if
                highlightTask == nil,
                highlightResult == nil {
                await highlightText()
            }
        }
        .onChange(of: styleName) { newStyleName in
            highlightText(newStyleName: newStyleName)
        }
        .onChange(of: colorScheme) { newColorScheme in
            self.highlightResult = nil
            highlightText(newColorScheme: newColorScheme)
        }
    }
    
    func highlightText(newStyleName: HighlightStyle.Name? = nil,
                       newColorScheme: ColorScheme? = nil) {
        highlightTask?.cancel()
        let styleName = newStyleName ?? styleName
        let colorScheme = newColorScheme ?? colorScheme
        let highlightStyle = HighlightStyle(styleName, colorScheme: colorScheme)
        self.highlightTask = Task {
            await highlightText(highlightStyle)
        }
    }
    
    func highlightText(_ style: HighlightStyle? = nil) async {
        let result = try? await Highlight.text(
            text,
            language: language,
            style: style ?? HighlightStyle(styleName, colorScheme: colorScheme)
        )
        if let result {
            await didHighlightText(result)
        }
    }
    
    @MainActor
    func didHighlightText(_ result: HighlightResult) {
        onHighlightResult?(result)
        if highlightResult == nil {
            highlightResult = result
        } else {
            withAnimation {
                highlightResult = result
            }
        }
    }
}

@available(iOS 16.1, *)
struct CodeText_Previews: PreviewProvider {
    static let python: String = """
    def fibonacci(n):
        \"""Return a list containing the Fibonacci series up to n.\"""
        result = []
        a, b = 0, 1
        while a < n:
            result.append(a)
            a, b = b, a + b
        return result

    # Call the function and print the results
    fib_series = fibonacci(100)
    print(fib_series)
    """
    
    static var previews: some View {
        CodeText(python, showBackground: true)
            .font(.caption)
            .padding()
    }
}
