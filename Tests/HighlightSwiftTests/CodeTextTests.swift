#if os(macOS)
import SwiftUI
import XCTest
@testable import HighlightSwift

final class CodeTextTests: XCTestCase {
    @MainActor
    func testUpdatesTextModeAndColorsAfterDisplayingCachedResult() async throws {
        let model = CodeSample()
        let cached = try await Highlight().request(model.text, mode: .language(.swift), colors: .light(.github))
        let appeared = expectation(description: "View appeared")
        let changedText = expectation(description: "Updated source text")
        let changedScheme = expectation(description: "Updated dark theme")
        let changedMode = expectation(description: "Updated language")

        let disappeared = expectation(description: "CodeText disappeared")
        let reappeared = expectation(description: "Refreshed cached code on reappearance")
        var results = [HighlightResult]()
        let view = SampleView(model: model, cached: cached, onDisappear: {
            if !model.visible { disappeared.fulfill() }
        }) { value in
            results.append(value)
            switch results.count {
            case 1: changedText.fulfill()
            case 2: changedScheme.fulfill()
            case 3: changedMode.fulfill()
            case 4: reappeared.fulfill()
            default: XCTFail("Unexpected callback")
            }
        }.onAppear { appeared.fulfill() }

        _ = NSApplication.shared
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 320, height: 80),
                              styleMask: .borderless, backing: .buffered, defer: false)
        window.contentView = NSHostingView(rootView: view)
        defer { window.contentView = nil }
        window.displayIfNeeded()
        await fulfillment(of: [appeared], timeout: 5)

        model.text = "let second = 2"
        await fulfillment(of: [changedText], timeout: 5)
        model.scheme = .dark
        await fulfillment(of: [changedScheme], timeout: 5)
        model.language = .plaintext
        await fulfillment(of: [changedMode], timeout: 5)

        let updatedText = model.text
        model.visible = false
        await fulfillment(of: [disappeared], timeout: 5)
        model.text = String(cached.attributedText.characters)
        model.language = .swift
        model.visible = true
        await fulfillment(of: [reappeared], timeout: 5)

        XCTAssertEqual(results.map { String($0.attributedText.characters) }, [updatedText, updatedText, updatedText, model.text])
        XCTAssertEqual(results.map(\.language), ["swift", "swift", "plaintext", "swift"])
        XCTAssertEqual(results.map(\.input.colors), [.light(.github), .dark(.github), .dark(.github), .dark(.github)])
    }

    @MainActor
    func testEnvironmentReusesItsDefaultHighlighter() {
        XCTAssertTrue(EnvironmentValues().highlight === EnvironmentValues().highlight)
        XCTAssertFalse(Highlight() === Highlight())
    }
}

private final class CodeSample: ObservableObject {
    @Published var visible = true
    @Published var text = "let first = 1"
    @Published var scheme = ColorScheme.light
    @Published var language = HighlightLanguage.swift
}

private struct SampleView: View {
    @ObservedObject var model: CodeSample
    let cached: HighlightResult
    let onDisappear: () -> Void
    let receive: (HighlightResult) -> Void

    var body: some View {
        if model.visible {
            CodeText(model.text, result: cached)
                .highlightLanguage(model.language)
                .codeTextColors(.theme(.github))
                .onHighlightSuccess(receive)
                .environment(\.colorScheme, model.scheme)
                .onDisappear(perform: onDisappear)
        }
    }
}
#endif
