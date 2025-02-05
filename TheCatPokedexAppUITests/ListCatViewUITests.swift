//
//  ListCatViewUITests.swift
//  TheCatPokedexAppUITests
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import XCTest
@MainActor
final class ListCatViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testNavigationTitleExists() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        XCTAssertTrue(app.navigationBars["The cat pokedex"].exists, "The navigation title should be visible")
    }

    func testCatListLoadsSuccessfully() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "The first cat cell should appear within 5 seconds")
    }

    func testSearchBarExists() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        XCTAssertTrue(app.searchFields["Search by breed"].exists, "Search bar should be visible")
    }

    func testPaginationTriggersOnScroll() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let list = app.collectionViews["catList"]

        list.swipeUp()
        list.swipeUp()

        let loadingIndicator = app.images["loadingNextPage"]
        XCTAssertTrue(loadingIndicator.waitForExistence(timeout: 5),  "Loading indicator should appear when fetching more cats")
    }

    func testNavigationToCatDetails() {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        app.launch()
        let firstCell = app.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "First cat cell should exist")

        firstCell.tap()

        let detailView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 5), "Cat details view should be displayed after tapping a cat")
    }
}
