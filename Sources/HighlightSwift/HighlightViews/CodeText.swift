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
    let background: Bool
    let onHighlight: ((HighlightResult) -> Void)?

    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - language: The language to use (default: automatic).
    ///   - style: The highlight style name to use (default: .xcode).
    ///   - background: Show the background color of the highlight style (default: false).
    ///   - onHighlight: Callback with the result of each highlight attempt (default: nil).
    public init(_ text: String,
                language: String? = nil,
                style styleName: HighlightStyle.Name = .xcode,
                background: Bool = false,
                onHighlight: ((HighlightResult) -> Void)? = nil) {
        self.text = text
        self.language = language
        self.styleName = styleName
        self.background = background
        self.onHighlight = onHighlight
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
        .padding(background ? 8 : 0)
        .background {
            if
                background,
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
        onHighlight?(result)
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
    static let code: String = """
    import SwiftUI

    struct SwiftUIView: View {
        var body: some View {
            Text("Hello World!")
        }
    }

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
    """
    
    static var previews: some View {
        CodeText(code)
            .padding()
            .font(.caption2)
    }
}
