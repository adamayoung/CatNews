//
//  CatNewsUITests.swift
//  CatNewsUITests
//
//  Created by Adam Young on 07/12/2020.
//

import XCTest

class CatNewsUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launchArguments = [
            "SKIP_ANIMATIONS",
            "UI_TEST"
        ]

        app.launch()
    }

    func testLoadsStories() throws {
        let table = app.tables["Stories"]
        XCTAssertTrue(table.exists)
        XCTAssertEqual(table.cells.count, 4)
    }

    func testNavigatesStory1() throws {
        let cell = app.tables["Stories"].cells["Headline 1"]
        XCTAssertTrue(cell.exists)
        cell.tap()

        let storyView = app.scrollViews["Story"]
        guard storyView.waitForExistence(timeout: 5) else {
            XCTFail("Story view didn't load")
                return
        }

        let headlineLabel = storyView.otherElements.staticTexts["Headline 1"]
        XCTAssertTrue(headlineLabel.exists)
    }

    func testNavigatesWeblink2() throws {
        let cell = app.tables["Stories"].cells["Weblink 2"]
        XCTAssertTrue(cell.exists)
        cell.tap()

        let webView = app.otherElements["Web view - https://www.sky.com"]
        guard webView.waitForExistence(timeout: 5) else {
            XCTFail("Web view didn't load")
                return
        }
    }

    func testNavigatesStory3() throws {
        let cell = app.tables["Stories"].cells["Headline 3"]
        XCTAssertTrue(cell.exists)
        cell.tap()

        let storyView = app.scrollViews["Story"]
        guard storyView.waitForExistence(timeout: 5) else {
            XCTFail("Story view didn't load")
                return
        }

        let headlineLabel = storyView.otherElements.staticTexts["Headline 3"]
        XCTAssertTrue(headlineLabel.exists)
    }

}
