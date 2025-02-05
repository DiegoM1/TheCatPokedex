//
//  FavoriteCatDetailsUITests.swift
//  TheCatPokedexAppUITests
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import XCTest

final class FavoriteCatDetailsUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launchArguments.append("UITesting")
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyFavoriteCats() throws {
        // UI tests must launch the application that they test.
        let favorites = app.buttons["Favorites"]
        favorites.tap()

        let emptyFavorites = app.staticTexts["emptyFavoritesCats"]

        XCTAssertTrue(emptyFavorites.waitForExistence(timeout: 2), "The empty component should appear in the screen")
    }

    func testValidateFavoriteCatAppears() throws {
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()


        let detailsView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(detailsView.waitForExistence(timeout: 5), "CatDetailsView should appear")

        let heartIcon = app.images["heart"]

        heartIcon.tap()

        let backButton = app.images["backButton"]

        backButton.tap()

        let favorites = app.buttons["Favorites"]
        favorites.tap()

        let firstFavoriteCell = app.collectionViews.cells.firstMatch

        XCTAssertTrue(firstFavoriteCell.waitForExistence(timeout: 2), "First favorite cat cell  should appear in the screen")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testNavigationToFavoriteCatDetails() throws {
        let firstCell = app.collectionViews.cells.firstMatch
        XCTAssertTrue(firstCell.waitForExistence(timeout: 5), "List should load")
        firstCell.tap()


        let detailsView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(detailsView.waitForExistence(timeout: 5), "CatDetailsView should appear")

        let heartIcon = app.images["heart"]

        heartIcon.tap()

        let backButton = app.images["backButton"]

        backButton.tap()

        let favorites = app.buttons["Favorites"]
        favorites.tap()

        let firstFavoriteCell = app.collectionViews.cells.firstMatch
        firstFavoriteCell.tap()

        let favoriteDetailsView = app.scrollViews["CatDetailsView"]
        XCTAssertTrue(favoriteDetailsView.waitForExistence(timeout: 5), "Favorite cat details should appear")
    }
}
