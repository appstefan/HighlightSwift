import HighlightSwift
import SwiftUI

@main
struct ForegroundApp: App {
    var body: some Scene {
        WindowGroup { CodeSample() }
    }
}

private struct CodeSample: View {
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) private var colorScheme
    @State private var cached: HighlightResult?
    @State private var backgroundVisits = 0

    private let source = """
    struct DocumentView: View {
        var body: some View {
            CodeText("print(42)")
        }
    }

    #Preview {
        DocumentView()
    }
    """

    var body: some View {
        VStack(alignment: .leading) {
            CodeText(source, result: cached)
                .highlightLanguage(.swift)
                .codeTextColors(.theme(.xcode))
                .onHighlightSuccess { cached = $0 }
                .font(.system(size: 16))
                .padding(12)
                .background(Color(uiColor: .secondarySystemBackground))
                .accessibilityIdentifier("code")

            if cached != nil && scenePhase == .active && colorScheme == .light {
                Text("Highlighted")
                    .accessibilityIdentifier("ready-\(backgroundVisits)")
                    .accessibilityValue(String(ProcessInfo.processInfo.processIdentifier))
            }
        }
        .onChange(of: scenePhase) { _, phase in
            if phase == .background { backgroundVisits += 1 }
        }
    }
}
