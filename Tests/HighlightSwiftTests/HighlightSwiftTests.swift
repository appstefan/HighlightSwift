import XCTest
@testable import HighlightSwift

final class HighlightSwiftTests: XCTestCase {
    let highlight = Highlight()
    
    let swiftCode: String = """
    import SwiftUI
    
    struct ContentView: View {
        var body: some View {
            NavigationView {
                List {
                    Text("Item \\(item)")
                }
                .navigationTitle("Items")
            }
        }
    }
    
    struct DetailView: View {
        var body: some View {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    """
    
    func testSimple() async throws {
        let attributedText = try await highlight.attributedText(swiftCode)
        XCTAssertEqual(String(attributedText.characters), swiftCode)
    }
    
    func testFortranAlias() async throws {
        let attributedText = try await highlight.attributedText(swiftCode, language: "fortran")
        XCTAssertEqual(String(attributedText.characters), swiftCode)
    }
    
    func testCustomColors() async throws {
        let customCSS: String = """
        .hljs { display: block; overflow-x: auto; padding: 0.5em; }
        .hljs, 
        .hljs-subst { color: black; }
        .hljs-string,
        .hljs-section,
        .hljs-selector-class,
        .hljs-template-variable,
        .hljs-deletion { color: #800; }
        """
        let result = try await highlight.request(swiftCode, colors: .custom(css: customCSS))
        XCTAssertFalse(result.isUndefined)
        XCTAssertGreaterThan(result.relevance, 5)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testAutomaticLanguage() async throws {
        let result = try await highlight.request(swiftCode)
        XCTAssertFalse(result.isUndefined)
        XCTAssertGreaterThan(result.relevance, 5)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testCorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.swift))
        XCTAssertFalse(result.isUndefined)
        XCTAssertGreaterThan(result.relevance, 5)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testCorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("swift"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertGreaterThan(result.relevance, 5)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testIncorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.python))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testIncorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("python"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }
    
    func testUnsupportedLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("babel"))
        XCTAssertTrue(result.isUndefined)
        XCTAssertEqual(result.relevance, 0)
        XCTAssertEqual(result.language, "unknown")
        XCTAssertEqual(result.languageName, "Unknown")
        XCTAssertEqual(String(result.attributedText.characters), swiftCode)
    }

    func testPreservesSourceText() async throws {
        let samples = [
            "", "  \t\n\n", "    let n = 42\n", "\n\nlet n = 42\n\n",
            "\tlet café = \"<&🙂>\"\r\n", "let a = 1\rlet b = 2\r",
            "let e\u{301} = \"👩🏽‍💻\""
        ]
        for source in samples {
            let result = try await highlight.attributedText(source, language: .swift)
            XCTAssertEqual(Array(String(result.characters).utf8), Array(source.utf8), source.debugDescription)
            if source.contains("let") {
                XCTAssertGreaterThan(result.runs.count, 1, source.debugDescription)
            }
        }
    }

    func testAllPublicLanguagesResolve() async throws {
        for language in HighlightLanguage.allCases {
            let result = try await highlight.request("42", mode: .language(language))
            XCTAssertFalse(result.isUndefined, language.rawValue)
            XCTAssertEqual(result.language, language.alias, language.rawValue)
        }
    }

    func testCacheDistinguishesUnicodeSpellings() {
        let composed = HighlightInput(text: "café", mode: .automatic, colors: .light(.xcode))
        let decomposed = HighlightInput(text: "cafe\u{301}", mode: .automatic, colors: .light(.xcode))
        XCTAssertNotEqual(composed, decomposed)
    }

    func testPlaintextUndefinedIsValidCode() async throws {
        let result = try await highlight.request("undefined", mode: .language(.plaintext))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(String(result.attributedText.characters), "undefined")
    }

    func testCancelledRequestThrows() async throws {
        do {
            try await Task { [highlight, swiftCode] in
                withUnsafeCurrentTask { $0?.cancel() }
                _ = try await highlight.request(swiftCode)
            }.value
            XCTFail("Expected cancellation")
        } catch is CancellationError { }
    }
}
