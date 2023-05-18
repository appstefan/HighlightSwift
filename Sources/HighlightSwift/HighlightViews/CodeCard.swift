import SwiftUI

#if os(iOS)
@available(iOS 16.1, *)
public struct CodeCard: View {
    @Environment(\.colorScheme)
    var colorScheme
    
    @State
    var styleName: HighlightStyle.Name
    
    @State
    var textStyle: Font.TextStyle
    
    @State
    var showStyleControls: Bool = false
    
    @State
    var highlightResult: HighlightResult?
    
    let text: String
    let initialTextStyle: Font.TextStyle
    let initialStyleName: HighlightStyle.Name
    
    /// Creates a card view that displays syntax highlighted code.
    /// - Parameters:
    ///   - text: The plain text code to highlight.
    ///   - style: The initial highlight color style (default: .xcode).
    ///   - textStyle: The initial font text style (default: .caption2).
    public init(_ text: String,
                style: HighlightStyle.Name = .xcode,
                textStyle: Font.TextStyle = .caption2) {
        self.text = text
        self.initialStyleName = style
        self.initialTextStyle = textStyle
        self._styleName = State(initialValue: style)
        self._textStyle = State(initialValue: textStyle)
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            Color
                .clear
                .contentShape(Rectangle())
                .onTapGesture(count: 2, perform: resetStyle)
                .onTapGesture(perform: toggleShowButtons)
            HStack {
                CodeText(text, style: styleName) { highlightResult in
                    withAnimation {
                        self.highlightResult = highlightResult
                    }
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
                    languageName(highlightResult)
                }
            }
        }
        .padding(12)
        .background {
            ZStack {
                if let highlightResult {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(highlightResult.backgroundColor)
                }
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(.thinMaterial)
            }
        }
        .onChange(of: colorScheme) { newValue in
            self.highlightResult = nil
        }
    }
    
    // MARK: - Actions
    
    func resetStyle() {
        withAnimation {
            showStyleControls = false
            textStyle = initialTextStyle
            styleName = initialStyleName
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
                systemImage("textformat.size")
            }
            Menu {
                Picker("Style", selection: $styleName) {
                    ForEach(HighlightStyle.Name.allCases) { styleName in
                        Text(styleName.rawValue)
                            .tag(styleName)
                    }
                }
            } label: {
                systemImage("paintpalette")
            }
            .menuStyle(.button)
        }
    }
    
    func systemImage(_ systemName: String) -> some View {
        Text("\(Image(systemName: systemName))")
            .font(.callout)
            .foregroundColor(.secondary)
            .frame(width: 34, height: 34)
            .background {
                Circle()
                    .fill(.ultraThinMaterial)
            }
    }
    
    func languageName(_ result: HighlightResult) -> some View {
        Text(result.languageName)
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background {
                Capsule()
                    .fill(.ultraThinMaterial)
            }
    }
}

@available(iOS 16.1, *)
@available(tvOS, unavailable)
struct CodeCard_Previews: PreviewProvider {
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
        ScrollView {
            CodeCard(code)
                .padding()
        }
    }
}
#endif
