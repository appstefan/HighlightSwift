import XCTest
@testable import HighlightSwift

final class HighlightSwiftTests: XCTestCase {
    let highlight = Highlight()
    
    let swiftCode: String = """
    import Foundation
    
    @objc class Person: Entity {
        var name: String!
        var age:  Int!
    
        init(name: String, age: Int) {
            /* /* ... */ */
        }

        // Return a descriptive string for this person
        func description(offset: Int = 0) -> String {
            return "\\(name) is \\(age + offset) years old"
        }
    }
    """
    
    func testSimple() async throws {
        let attributedText = try await highlight.attributed(swiftCode)
        XCTAssertEqual(attributedText.characters.count, 318)
    }
    
    func testSimpleUnsupported() async throws {
        let attributedText = try await highlight.attributed(swiftCode, language: "fortran")
        XCTAssertEqual(attributedText.characters.count, 318)
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
        let colors = HighlightColors(css: customCSS, background: "")
        let result = try await highlight.request(swiftCode, colors: colors)
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 20)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testAutomaticLanguage() async throws {
        let result = try await highlight.request(swiftCode)
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 20)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testCorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.swift))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 20)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testCorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("swift"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 20)
        XCTAssertEqual(result.language, "swift")
        XCTAssertEqual(result.languageName, "Swift")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testIncorrectLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .language(.python))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testIncorrectLanguageAlias() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("python"))
        XCTAssertFalse(result.isUndefined)
        XCTAssertEqual(result.relevance, 4)
        XCTAssertEqual(result.language, "python")
        XCTAssertEqual(result.languageName, "Python?")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
    
    func testUnsupportedLanguage() async throws {
        let result = try await highlight.request(swiftCode, mode: .languageAlias("fortran"))
        XCTAssertTrue(result.isUndefined)
        XCTAssertEqual(result.relevance, 0)
        XCTAssertEqual(result.language, "unknown")
        XCTAssertEqual(result.languageName, "Unknown")
        XCTAssertEqual(result.attributedText.characters.count, 318)
    }
}
