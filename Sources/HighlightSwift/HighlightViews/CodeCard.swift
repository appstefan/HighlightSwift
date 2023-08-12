import SwiftUI

#if os(iOS)
@available(iOS 16.1, *)
public struct CodeCard: View {
  @Environment(\.colorScheme) private var colorScheme
  
  @State var textStyle: Font.TextStyle
  @State var showStyleControls: Bool = false
  @State var highlightResult: HighlightResult?
  
  let text: String
  let language: HighlightStyle.Language
  let initialColorScheme: ColorScheme?
  let initialTextStyle: Font.TextStyle
  
  /// Creates a card view that displays syntax highlighted code.
  /// - Parameters:
  ///   - text: The plain text code to highlight.
  ///   - language: The initial language style (default: .swift).
  ///   - style: The initial highlight color style (default: .xcode).
  ///   - textStyle: The initial font text style (default: .caption2).
  public init(_ text: String,
              language: HighlightStyle.Language = .swift,
              initialColorScheme: ColorScheme? = nil,
              textStyle: Font.TextStyle = .caption2) {
    self.text = text
    self.language = language
    self.initialColorScheme = initialColorScheme
    self.initialTextStyle = textStyle
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
        CodeText(
          text,
          language: language,
          colorScheme: initialColorScheme ?? colorScheme) { highlightResult in
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
    Button(action: toggleFontTextStyle) {
      systemImage("textformat.size")
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
    Text(language.rawValue)
      .font(.caption2)
      .fontWeight(.semibold)
      .foregroundColor(.secondary)
      .padding(.vertical, 4)
      .padding(.horizontal, 8)
      .background {
        Capsule()
          .fill(Color.secondary)
      }
  }
}

@available(iOS 16.1, *)
@available(tvOS, unavailable)
struct CodeCard_Previews: PreviewProvider {
  static let code: String =
    """
    @main
    struct SwiftUILibrary: App {
      var body: some Scene {
        WindowGroup {
          Text("Hello, world!")
        }
      }
    }
    """
  
  static var previews: some View {
    ScrollView {
      CodeCard(code, language: .swift)
        .padding()
    }
  }
}
#endif
