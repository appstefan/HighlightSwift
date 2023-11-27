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
    private var theme: HighlightTheme = .xcode
    
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
    public func codeTextTheme(_ theme: HighlightTheme) -> CodeText {
        var content = self
        content.theme = theme
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
        theme: HighlightTheme? = nil,
        colorScheme: ColorScheme? = nil
    ) async {
        let mode = mode ?? self.mode
        let theme = theme ?? self.theme
        let scheme = colorScheme ?? self.colorScheme
        let colors = HighlightColors(theme: theme, colorScheme: scheme)
        do {
            let result = try await highlight.request(
                text,
                mode: mode,
                colors: colors
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
            .onChange(of: theme) { newTheme in
                task?.cancel()
                task = Task {
                    await highlightText(theme: newTheme)
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
    @State var theme: HighlightTheme = .xcode
    
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
                .codeTextTheme(theme)
                .codeTextLanguage(.swift)
                .font(fontToggle ? .caption2 : .subheadline)
            Button {
                withAnimation {
                    fontToggle = !fontToggle
                    theme = fontToggle ? .solarFlare : .xcode
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
