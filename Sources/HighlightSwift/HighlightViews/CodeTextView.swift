import SwiftUI

@available(iOS 16.1, tvOS 16.1, *)
extension CodeText: View {
    public var body: some View {
        Text(attributedText)
            .fontDesign(.monospaced)
            .padding(.vertical, style.verticalPadding)
            .padding(.horizontal, style.horizontalPadding)
            .background(background)
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

    @ViewBuilder
    private var background: some View {
        if let card = style as? CardCodeTextStyle {
            ZStack {
                RoundedRectangle(cornerRadius: card.cornerRadius, style: card.cornerStyle)
                    .fill(highlightResult?.backgroundColor ?? .clear)
                RoundedRectangle(cornerRadius: card.cornerRadius, style: card.cornerStyle)
                .stroke(card.stroke, lineWidth: card.lineWidth)
            }
        } else {
            EmptyView()
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
                .codeTextStyle(.card)
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
