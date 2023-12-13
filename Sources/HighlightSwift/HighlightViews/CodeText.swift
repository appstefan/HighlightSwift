import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
public struct CodeText {
    //  MARK: - Properties
    
    @Environment(\.colorScheme)
    var colorScheme
    
    @Environment(\.highlight) 
    var highlight
    
    @Binding 
    var result: HighlightResult?
    
    @State
    var task: Task<Void, Never>?
    
    @State
    var attributedText: AttributedString?
    
    private let text: String
    private var mode: HighlightMode = .automatic
    private var colors: CodeTextColors = .theme(.xcode)
    
    //  MARK: - Initializer
    
    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: Some plain text code to highlight and display.
    ///   - result: A binding to the highlight result (default: nil).
    public init(_ text: String, result: Binding<HighlightResult?> = .constant(nil)) {
        self.text = text
        self._result = result
    }
    
    //  MARK: - Modifiers
    
    /// Sets the language detection mode for this code text.
    /// See also: `codeTextLanguage(_:)` to directly apply `.language` mode.
    public func codeTextMode(_ mode: HighlightMode) -> CodeText {
        var content = self
        content.mode = mode
        return content
    }
    
    /// Sets the highlight color theme for this code text.
    public func codeTextColors(_ colors: CodeTextColors) -> CodeText {
        var content = self
        content.colors = colors
        return content
    }
    
    /// Sets the a specific language for this code text.
    /// Disables automatic language detection mode.
    public func codeTextLanguage(_ language: HighlightLanguage) -> CodeText {
        var content = self
        content.mode = .language(language)
        return content
    }
    
    //  MARK: - Functions

    private nonisolated func highlightText(
        mode: HighlightMode? = nil,
        colors: CodeTextColors? = nil,
        colorScheme: ColorScheme? = nil
    ) async {
        let mode = mode ?? self.mode
        let colors = colors ?? self.colors
        let scheme = colorScheme ?? self.colorScheme
        let schemeColors = scheme == .dark ? colors.dark : colors.light
        do {
            let result = try await highlight.request(
                text,
                mode: mode,
                colors: schemeColors
            )
            guard !Task.isCancelled else {
                return
            }
            await MainActor.run {
                self.result = result
                withAnimation {
                    self.attributedText = result.attributedText
                }
            }
        } catch {
            return
        }
    }
}

//  MARK: - View

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText: View {
    public var body: some View {
        Text(attributedText ?? AttributedString(stringLiteral: text))
            .fontDesign(.monospaced)
            .task {
                guard attributedText == nil else {
                    return
                }
                await highlightText()
            }
            .onChange(of: mode) { newMode in
                task?.cancel()
                task = Task {
                    await highlightText(mode: newMode)
                }
            }
            .onChange(of: colors) { newColors in
                task?.cancel()
                task = Task {
                    await highlightText(colors: newColors)
                }
            }
            .onChange(of: colorScheme) { newColorScheme in
                task?.cancel()
                task = Task {
                    await highlightText(colorScheme: newColorScheme)
                }
            }
    }
}

//  MARK: - Preview

@available(iOS 16.1, tvOS 16.1, *)
private struct PreviewCodeText: View {
    @State var fontToggle: Bool = false
    @State var colors: CodeTextColors = .theme(.xcode)
    
    let code: String = """
    import SwiftUI
    
    struct SwiftUIView: View {
        var body: some View {
            Text("Hello World!")
        }
    }
    """
    
    var body: some View {
        List {
            CodeText(code)
                .codeTextColors(colors)
                .codeTextLanguage(.swift)
                .font(fontToggle ? .caption2 : .subheadline)
            Button {
                withAnimation {
                    fontToggle = !fontToggle
                    colors = .theme(fontToggle ? .solarFlare : .xcode)
                }
            } label: {
                Text("Change style")
            }
        }
    }
}

@available(iOS 16.1, tvOS 16.1, *)
#Preview {
    PreviewCodeText()
}
