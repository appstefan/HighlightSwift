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
        XCTAssertEqual(attributedText.characters.count, 477)
    }
    
    func testSimpleUnsupported() async throws {
        let attributedText = try await highlight.attributedText(swiftCode, language: "fortran")
        XCTAssertEqual(attributedText.characters.count, 477)
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
        XCTAssertEqual(result.relevance, 15)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testAutomaticLanguage() async throws {
        let result = try await highlight.request(swiftCode)
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 15)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testCorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.swift))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 15)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testCorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("swift"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 15)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testIncorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.python))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testIncorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("python"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
    
    func testUnsupportedLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("babel"))
        XCTAssertTrue(result.isUndefined)
        XCTAssertEqual(result.relevance, 0)
        XCTAssertEqual(result.language, "unknown")
        XCTAssertEqual(result.languageName, "Unknown")
        XCTAssertEqual(result.attributedText.characters.count, 477)
    }
}
