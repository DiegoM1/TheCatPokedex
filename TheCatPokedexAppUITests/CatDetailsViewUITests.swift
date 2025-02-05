//
//  CatDetailsViewUITests.swift
//  TheCatPokedexAppUITests
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import XCTest

final class CatDetailsViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testCatDetailsViewDisplaysCorrectData() throws {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()


        let detailsView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(detailsView.waitForExistence(timeout: 5), "CatDetailsView should appear")

        let catImage = app.images.firstMatch
        XCTAssertTrue(catImage.exists, "Cat Image should exist")

        let catInformationComponent = app.staticTexts["catInformation"]
        XCTAssertTrue(catInformationComponent.exists, "Origin text should be displayed")

        let temperamentComponent = app.staticTexts["temperament"]
        XCTAssertTrue(temperamentComponent.exists, "Temperament section should exist")

        let qualityRatingsComponent = app.staticTexts["qualityRating"]
        XCTAssertTrue(qualityRatingsComponent.exists, "Quality Ratings section should exist")

        app.swipeUp()

        let moreInfoText = app.staticTexts["moreInfoUrls"]
        XCTAssertTrue(moreInfoText.exists, "More Information section should exist")
    }

    func testCatDetailsViewBackButtonWorks() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()

        let backButton = app.images["backButton"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button should be visible")

        backButton.tap()

        let listView = app.navigationBars["The cat pokedex"]
        XCTAssertTrue(listView.waitForExistence(timeout: 5), "Should return to List View")
    }

    func testNavigationToWebView() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()

        let wikipediaButton = app.buttons["wikipedia"]

        wikipediaButton.tap()
        XCTAssertTrue(app.webViews.firstMatch.waitForExistence(timeout: 5), "Should navigate to Wikipedia")
    }

    func testWebViewBackButtonWorks() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()

        let wikipediaButton = app.buttons["wikipedia"]

        wikipediaButton.tap()
        XCTAssertTrue(app.webViews.firstMatch.waitForExistence(timeout: 5), "Should navigate to Wikipedia")

        app.buttons["Back"].firstMatch.tap()
        let detailsView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(detailsView.waitForExistence(timeout: 5), "CatDetailsView should appear")
    }
}
