import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText: View {
    public var body: some View {
        let input = self.input
        let result = currentResult(for: input)
        Text(result?.attributedText ?? AttributedString(input.text))
            .fontDesign(.monospaced)
            .padding(.vertical, style.verticalPadding)
            .padding(.horizontal, style.horizontalPadding)
            .background {
                if let cardStyle = style as? CardCodeTextStyle {
                    CodeTextCardView(
                        style: cardStyle,
                        color: result?.backgroundColor
                    )
                }
            }
            .task(id: input) {
                await highlightText(input)
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
