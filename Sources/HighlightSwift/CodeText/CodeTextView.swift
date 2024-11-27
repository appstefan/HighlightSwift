import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText: View {
    public var body: some View {
        Text(attributedText)
            .fontDesign(.monospaced)
            .padding(.vertical, style.verticalPadding)
            .padding(.horizontal, style.horizontalPadding)
            .background {
                if let cardStyle = style as? CardCodeTextStyle {
                    CodeTextCardView(
                        style: cardStyle,
                        color: highlightResult?.backgroundColor
                    )
                }
            }
            .onAppear {
                guard highlightResult == nil else {
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

//  MARK: - Preview

@available(iOS 16.1, tvOS 16.1, *)
private struct PreviewCodeText: View {
    @State var colors: CodeTextColors = .theme(.xcode)
    @State var font: Font = .body

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
                .codeTextStyle(.card)
                .codeTextColors(colors)
                .highlightLanguage(.swift)
                .font(font)
            Button {
                withAnimation {
                    colors = .theme(randomTheme())
                    font = randomFont()
                }
            } label: {
                Text("Random")
            }
        }
    }
    
    func randomTheme() -> HighlightTheme {
        let cases = HighlightTheme.allCases
        return cases[.random(in: 0..<cases.count)]
    }
    
    func randomFont() -> Font {
        let cases: [Font] = [
            .body,
            .callout,
            .caption,
            .caption2,
            .footnote,
            .headline,
            .largeTitle,
            .subheadline,
            .title
        ]
        return cases[.random(in: 0..<cases.count)]
    }
}

@available(iOS 16.1, tvOS 16.1, *)
#Preview {
    PreviewCodeText()
}
