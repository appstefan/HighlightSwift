import OSLog
import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
public struct CodeText {
    @Binding var result: HighlightResult?
    
    @State private var logger: Logger
    @State private var highlight: Highlight
    @State private var highlightTask: Task<Void, Never>?
    @State private var highlightResult: HighlightResult?
    
    @Environment(\.colorScheme) private var colorScheme

    private let text: String
    private var showBackground: Bool = true
    private var mode: HighlightMode = .automatic
    private var colors: CodeTextColors = .theme(.xcode)
        
    /// Creates a text view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: Some plain text code to highlight and display.
    ///   - showBackground: A boolean indicating wether to
    ///   - result: A binding to the highlight result (default: nil).
    public init(
        _ text: String,
        showBackground: Bool = true,
        result: Binding<HighlightResult?> = .constant(nil)
    ) {
        self.text = text
        self._result = result
        self.showBackground = showBackground
        self.highlight = Highlight()
        self.logger = Logger(subsystem: "HighlightSwift", category: "CodeText")
    }
    
    private var attributedText: AttributedString {
        highlightResult?.attributedText ?? AttributedString(stringLiteral: text)
    }
    
    @MainActor
    private func highlightText(
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
            highlightResult = try await highlight.request(text, mode: mode, colors: schemeColors)
            result = highlightResult
        } catch {
            logger.log(level: .error, "\(error.localizedDescription)")
        }
    }
}

//  MARK: - View

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText: View {
    @ViewBuilder
    var background: some View {
        if 
            let highlightResult,
            showBackground {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(highlightResult.backgroundColor)
            }
        } else {
            EmptyView()
        }
    }
    
    public var body: some View {
        Text(attributedText)
            .fontDesign(.monospaced)
            .padding(.vertical, showBackground ? 8 : 0)
            .padding(.horizontal, showBackground ? 10 : 0)
            .background(background)
            .onAppear {
                guard result == nil else {
                    return
                }
                highlightTask = Task {
                    await highlightText()
                }
            }
            .onDisappear {
                highlightTask?.cancel()
            }
            .onChange(of: mode) { newMode in
                highlightTask?.cancel()
                highlightTask = Task {
                    await highlightText(mode: newMode)
                }
            }
            .onChange(of: colors) { newColors in
                highlightTask?.cancel()
                highlightTask = Task {
                    await highlightText(colors: newColors)
                }
            }
            .onChange(of: colorScheme) { newColorScheme in
                highlightTask?.cancel()
                highlightTask = Task {
                    await highlightText(colorScheme: newColorScheme)
                }
            }
    }
}

//  MARK: - Modifiers

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText {
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
            CodeText(code, showBackground: true)
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
