import XCTest

final class AssemblyUITests: XCTestCase {
    func testAssemblyControlsAndCompletion() {
        let app = XCUIApplication()
        app.launch()
        let counter = app.staticTexts["assemblyProgress"]
        XCTAssertTrue(counter.waitForExistence(timeout: 10))
        XCTAssertEqual(counter.label, "000 / 104")
        XCTAssertFalse(app.buttons["Previous"].isEnabled)
        app.buttons["Next"].tap()
        XCTAssertEqual(counter.label, "001 / 104")
        XCTAssertTrue(app.otherElements["59. L HEEL ARMOR"].exists)
        XCTAssertFalse(app.otherElements["1. HELMET CROWN"].isHittable)
        app.buttons["Previous"].tap()
        XCTAssertEqual(counter.label, "000 / 104")
        app.buttons["PlayAll"].tap()
        XCTAssertTrue(app.buttons["Pause"].waitForExistence(timeout: 3))
        app.buttons["Pause"].tap()
        let stopped = counter.label
        XCTAssertEqual(counter.label, stopped)
        app.buttons["Reset"].tap()
        XCTAssertEqual(counter.label, "000 / 104")
        app.buttons["PlayAll"].tap()
        let complete = NSPredicate(format: "label == %@", "104 / 104")
        expectation(for: complete, evaluatedWith: counter)
        waitForExpectations(timeout: 65)
        XCTAssertTrue(app.staticTexts["J.A.R.V.I.S. / SYSTEM ONLINE"].waitForExistence(timeout: 5))
        XCTAssertFalse(app.buttons["Next"].isEnabled)
        XCTAssertTrue(app.staticTexts["ASSEMBLY COMPLETE"].exists)
        // Accessibility updates at the start of the 1.2-second reveal. Capture its settled frame.
        Thread.sleep(forTimeInterval: 1.4)
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "iPhone — assembly complete"
        attachment.lifetime = .keepAlways
        add(attachment)
        app.buttons["Previous"].tap()
        XCTAssertEqual(counter.label, "103 / 104")
        let maskHidden = NSPredicate(format: "hittable == false")
        expectation(for: maskHidden, evaluatedWith: app.otherElements["2. FACE PLATE"])
        waitForExpectations(timeout: 3)
        XCTAssertFalse(app.staticTexts["J.A.R.V.I.S. / SYSTEM ONLINE"].exists)
        app.buttons["Reset"].tap()
        XCTAssertEqual(counter.label, "000 / 104")
    }

    func testReferenceUnderlayToggle() {
        let app = XCUIApplication()
        app.launchArguments = ["--assembled"]
        app.launch()
        let toggle = app.buttons["ReferenceToggle"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 10))
        XCTAssertEqual(toggle.value as? String, "關閉")
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "開啟")
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Reference registration overlay"
        attachment.lifetime = .keepAlways
        add(attachment)
        toggle.tap()
        XCTAssertEqual(toggle.value as? String, "關閉")
    }
}
