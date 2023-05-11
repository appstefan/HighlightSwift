import SwiftUI

#if os(iOS)
@available(iOS 16.1, *)
public struct CodeCard: View {
    @Environment(\.colorScheme)
    var colorScheme
    
    @State
    var style: HighlightStyle
    
    @State
    var textStyle: Font.TextStyle
    
    @State
    var showStyleControls: Bool = false
    
    @State
    var highlightResult: HighlightResult?
    
    let text: String
    let initialStyle: HighlightStyle
    let initialTextStyle: Font.TextStyle

    public init(_ text: String,
                style: HighlightStyle = .stackoverflow,
                textStyle: Font.TextStyle = .caption2) {
        self.text = text
        self.initialStyle = style
        self.initialTextStyle = textStyle
        self._style = State(initialValue: style)
        self._textStyle = State(initialValue: textStyle)
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture(count: 2, perform: resetStyle)
                .onTapGesture(perform: toggleShowButtons)
            HStack {
                CodeText(text, style: style) { highlightResult in
                    self.highlightResult = highlightResult
                }
                .font(.system(textStyle))
                .textSelection(.enabled)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture(count: 2, perform: resetStyle)
            .onTapGesture(perform: toggleShowButtons)
            VStack(alignment: .trailing) {
                if showStyleControls {
                    styleControls
                }
                Spacer(minLength: 12)
                if let highlightResult {
                    languageText(highlightResult)
                }
            }
        }
        .padding(12)
        .background {
            ZStack {
                if let highlightResult {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(highlightResult.backgroundColor)
                }
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.thinMaterial, lineWidth: 2)
            }
        }
        .onChange(of: colorScheme) { newValue in
            self.highlightResult = nil
        }
    }
    
    // MARK: - Actions
    
    func resetStyle() {
        withAnimation {
            style = initialStyle
            textStyle = initialTextStyle
            showStyleControls = false
        }
    }
    
    func toggleShowButtons() {
        withAnimation {
            showStyleControls.toggle()
        }
    }
    
    func toggleFontTextStyle() {
        withAnimation {
            switch textStyle {
            case .body:
                textStyle = .caption2
            case .callout:
                textStyle = .body
            case .footnote:
                textStyle = .callout
            case .caption:
                textStyle = .footnote
            case .caption2:
                textStyle = .caption
            default:
                textStyle = .caption2
            }
        }
    }
    
    // MARK: - Views

    var styleControls: some View {
        VStack(spacing: 12) {
            Button(action: toggleFontTextStyle) {
                systemImageText("textformat.size")
            }
            Menu {
                Picker("Style", selection: $style) {
                    ForEach(HighlightStyle.allCases) { style in
                        Text(style.displayName)
                            .tag(style)
                    }
                }
            } label: {
                systemImageText("paintpalette")
            }
            .menuStyle(.button)
        }
    }
    
    func systemImageText(_ systemName: String) -> some View {
        Text("\(Image(systemName: systemName))")
            .font(.system(.callout, weight: .semibold))
            .foregroundColor(Color.secondary.opacity(0.7))
            .frame(width: 36, height: 36)
            .background {
                Circle()
                    .fill(.ultraThinMaterial)
            }
    }
    
    func languageText(_ result: HighlightResult) -> some View {
        Text("\(result.language.capitalized)" + (result.relevance > 5 ? "" : "?"))
            .opacity(0.7)
            .foregroundColor(.secondary)
            .font(.system(.caption2, weight: .semibold))
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background {
                Capsule()
                    .fill(.ultraThinMaterial)
            }
    }
}

@available(iOS 16.1, *)
struct CodeCard_Previews: PreviewProvider {
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
        ScrollView {
            CodeCard(python, style: .atomOne, textStyle: .body)
                .padding()
        }
    }
}
#endif
