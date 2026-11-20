import UIKit
import XCTest

final class ForegroundTests: XCTestCase {
    @MainActor
    func testLightThemeSurvivesReturningFromHome() throws {
        continueAfterFailure = false
        let device = XCUIDevice.shared
        let previousAppearance = device.appearance
        device.appearance = .light
        defer { device.appearance = previousAppearance }

        let app = XCUIApplication()
        app.launch()
        let initial = app.staticTexts["ready-0"]
        XCTAssertTrue(initial.waitForExistence(timeout: 15))
        let process = try XCTUnwrap(initial.value as? String)
        let code = app.staticTexts["code"]
        let initialInk = try darkPixelCount(in: code, name: "Before Home")
        XCTAssertGreaterThan(initialInk, 0)

        for visit in 1...5 {
            device.press(.home)
            let backgrounded = XCTNSPredicateExpectation(predicate: NSPredicate { _, _ in
                app.state == .runningBackground || app.state == .runningBackgroundSuspended
            }, object: nil)
            XCTAssertEqual(XCTWaiter.wait(for: [backgrounded], timeout: 10), .completed)

            app.activate()
            let resumed = app.staticTexts["ready-\(visit)"]
            XCTAssertTrue(resumed.waitForExistence(timeout: 15))
            XCTAssertEqual(resumed.value as? String, process)
            let ink = try darkPixelCount(in: code, name: "After return \(visit)")
            // The regression turns the dark code text pale on the light card.
            XCTAssertGreaterThanOrEqual(Double(ink) / Double(initialInk), 0.9)
        }
    }

    private func darkPixelCount(in element: XCUIElement, name: String) throws -> Int {
        let screenshot = element.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        add(attachment)

        let image = try XCTUnwrap(screenshot.image.cgImage)
        var luminance = [UInt8](repeating: 0, count: image.width * image.height)
        try luminance.withUnsafeMutableBytes { buffer in
            let context = try XCTUnwrap(CGContext(
                data: buffer.baseAddress, width: image.width, height: image.height,
                bitsPerComponent: 8, bytesPerRow: image.width,
                space: CGColorSpaceCreateDeviceGray(), bitmapInfo: CGImageAlphaInfo.none.rawValue
            ))
            context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
        }
        return luminance.filter { $0 < 80 }.count
    }
}
