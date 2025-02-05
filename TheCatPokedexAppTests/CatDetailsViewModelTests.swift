//
//  CatDetailsViewModelTests.swift
//  TheCatPokedexAppTests
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import XCTest
import SwiftData
@testable import TheCatPokedexApp

@MainActor
final class CatDetailsViewModelTests: XCTestCase {
    var viewModel: CatDetailsViewModel!
    var modelContainer: ModelContainer!

    override func setUpWithError() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        modelContainer = try ModelContainer(for: FavoriteCat.self, configurations: config)
        let cat = CatData(id: "9x1zk_Qdr", breeds: [BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian",cfaUrl: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg", vetstreetUrl: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4)], url: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg")
        viewModel = CatDetailsViewModel(cat: cat)
        viewModel.modelContext = modelContainer.mainContext
    }

    func testCheckIsFavorite() throws {
        viewModel.checkIsFavorite()
        
        XCTAssertNotNil(viewModel.isFavorite)
        XCTAssertFalse(viewModel.isFavorite!)
    }

    func testhandleFavoriteActionisFavoriteFalse() throws {
        // Given
        viewModel.checkIsFavorite()

        // Then
        viewModel.handleFavoriteAction()

        let fetchDescriptor = FetchDescriptor<FavoriteCat>()
        let data = try? viewModel.modelContext?.fetch(fetchDescriptor)
        XCTAssertNotNil(data)
        XCTAssertFalse(data!.isEmpty)
        XCTAssertEqual(data?.count, 1)
    }

    func testhandleFavoriteActionisFavoriteTrue() throws {
        // Then
        viewModel.handleFavoriteAction() // Add Cat to favorite

        viewModel.handleFavoriteAction() // Remove Cat from favorite


        let fetchDescriptor = FetchDescriptor<FavoriteCat>()
        let data = try? viewModel.modelContext?.fetch(fetchDescriptor)
        XCTAssertTrue(data!.isEmpty)
        XCTAssertEqual(data?.count, 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
