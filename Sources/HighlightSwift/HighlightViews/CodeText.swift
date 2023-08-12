import SwiftUI

@available(iOS 16.1, *)
@available(tvOS 16.1, *)
public struct CodeText: View {
  @Environment(\.colorScheme) private var colorScheme
  
  @State var highlightTask: Task<Void, Never>?
  @State var highlightResult: HighlightResult?
  
  let text: String
  let language: HighlightStyle.Language
  let initialColorScheme: ColorScheme?
  let onHighlight: ((HighlightResult) -> Void)?
  
  /// Creates a text view that displays syntax highlighted code.
  /// - Parameters:
  ///   - text: The plain text code to highlight.
  ///   - language: The language to use (default: automatic).
  ///   - colorScheme: The highlight style described by ColorScheme (default: nil).
  ///   - onHighlight: Callback with the result of each highlight attempt (default: nil).
  public init(_ text: String,
              language: HighlightStyle.Language = .swift,
              colorScheme: ColorScheme? = nil,
              onHighlight: ((HighlightResult) -> Void)? = nil) {
    self.text = text
    self.language = language
    self.initialColorScheme = colorScheme
    self.onHighlight = onHighlight
  }
  
  public var body: some View {
    highlightedText
      .fontDesign(.monospaced)
      .task {
        if highlightTask == nil, highlightResult == nil {
          if let initialColorScheme {
            await highlightText(HighlightStyle(colorScheme: initialColorScheme))
          }
          else {
            await highlightText(HighlightStyle(colorScheme: colorScheme))
          }
        }
      }
      .onChange(of: colorScheme) { newColorScheme in
        highlightResult = nil
        highlightText(colorScheme: newColorScheme)
      }
  }
  
  private var highlightedText: Text {
    if let highlightResult {
      return Text(highlightResult.attributed)
    } else {
      return Text(text)
    }
  }
  
  private func highlightText(colorScheme: ColorScheme) {
    let highlightStyle = HighlightStyle(colorScheme: colorScheme)
    highlightTask?.cancel()
    highlightTask = Task {
      await highlightText(highlightStyle)
    }
  }
  
  private func highlightText(_ style: HighlightStyle) async {
    do {
      let result = try await Highlight.text(
        text,
        language: language,
        style: style
      )
      await handleHighlightResult(result)
    } catch {
      print(error)
    }
  }
  
  @MainActor
  private func handleHighlightResult(_ result: HighlightResult) {
    onHighlight?(result)
    if highlightResult == nil {
      highlightResult = result
    } else {
      withAnimation {
        highlightResult = result
      }
    }
  }
}

@available(iOS 16.1, *)
@available(tvOS 16.1, *)
struct CodeText_Previews: PreviewProvider {
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
    CodeText(code)
      .padding()
      .font(.caption2)
  }
}
