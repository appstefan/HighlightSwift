import SwiftUI

#if os(iOS)
@available(iOS 16.1, *)
public struct CodeCard: View {
  @Environment(\.colorScheme) private var colorScheme: ColorScheme
  
  @State var showsLanguage: Bool = true
  @State var highlightResult: HighlightResult?
  
  let text: String
  let language: HighlightStyle.Language
  let textStyle: Font.TextStyle
  
  /// Creates a card view that displays syntax highlighted code.
  /// - Parameters:
  ///   - text: The plain text code to highlight.
  ///   - language: The language style with syntax highlight (default: .swift).
  ///   - textStyle: The text style to display fonts (default: .footnote).
  public init(_ text: String,
              language: HighlightStyle.Language = .swift,
              textStyle: Font.TextStyle = .footnote) {
    self.text = text
    self.language = language
    self.textStyle = textStyle
  }
  
  public var body: some View {
    ZStack(alignment: .topTrailing) {
      Color
        .clear
        .contentShape(Rectangle())
        .onTapGesture(perform: toggleShowLanguage)
      HStack {
        CodeText(text, language: language, textStyle: textStyle) { highlightResult in
          withAnimation {
            self.highlightResult = highlightResult
          }
        }
        .textSelection(.enabled)
        Spacer()
      }
      .contentShape(Rectangle())
      .onTapGesture(perform: toggleShowLanguage)
      if showsLanguage {
        VStack(alignment: .trailing) {
          Spacer(minLength: 12)
          if let highlightResult {
            languageName(highlightResult)
          }
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
  
  func toggleShowLanguage() {
    withAnimation {
      showsLanguage.toggle()
    }
  }
  
  // MARK: - Views
  
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
      CodeCard(code, language: .swift, textStyle: .caption2)
        .padding()
    }
  }
}
#endif
