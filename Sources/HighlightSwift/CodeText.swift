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
    let style: HighlightStyle
    let showBackground: Bool
    let onHighlightResult: ((HighlightResult) -> Void)?

    public init(_ text: String,
                style: HighlightStyle = .stackoverflow,
                language: String? = nil,
                showBackground: Bool = false,
                onHighlightResult: ((HighlightResult) -> Void)? = nil) {
        self.text = text
        self.style = style
        self.language = language
        self.showBackground = showBackground
        self.onHighlightResult = onHighlightResult
    }
    
    public var body: some View {
        ZStack {
            if let highlightResult {
                Text(highlightResult.attributedText)
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
        .onChange(of: style) { newStyle in
            highlightText(newStyle: newStyle)
        }
        .onChange(of: colorScheme) { newColorScheme in
            self.highlightResult = nil
            highlightText(newColorScheme: newColorScheme)
        }
    }
    
    func highlightText(newStyle: HighlightStyle? = nil,
                       newColorScheme: ColorScheme? = nil) {
        highlightTask?.cancel()
        let style = newStyle ?? style
        let colorScheme = newColorScheme ?? colorScheme
        let styleName = style.name(colorScheme)
        self.highlightTask = Task {
            await highlightText(styleName)
        }
    }
    
    func highlightText(_ styleName: String? = nil) async {
        do {
            let result = try await Highlight.text(
                text,
                language: language,
                styleName: styleName ?? style.name(colorScheme)
            )
            await didHighlightText(result)
        } catch is CancellationError {
            //
        } catch is HighlightError {
            self.errorText = "Highlight error"
        } catch {
            self.errorText = "Unknown error"
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
    def factorial(n):
        if n == 0:
            return 1
        else:
            return n * factorial(n-1)

    try:
        print(factorial(5))
    except RecursionError:
        print("Too large input.")
    """
    
    static var previews: some View {
        CodeText(python, style: .paraiso, showBackground: true)
            .font(.subheadline)
    }
}
