//
//  ListCatViewModelTests.swift
//  TheCatPokedexAppTests
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import XCTest
@testable import TheCatPokedexApp

final class ListCatViewModelTests: XCTestCase {

    var viewModel: ListCatViewModel!
    var mockService: CatApiServiceMock!

    override func setUpWithError() throws {
        mockService = CatApiServiceMock()
        viewModel = ListCatViewModel(service: mockService)
    }

    override func tearDownWithError() throws {
        mockService = nil
        viewModel = nil
    }

    func testFetchCatsSuccess() async throws {
        await viewModel.reloadCats()

        XCTAssertEqual(viewModel.cats.count, 10)
        XCTAssert(viewModel.cats[0].id == "92D9NZLs0")
        XCTAssert(viewModel.viewState == .success)
    }

    func testFetchCatsFailure() async throws {
        mockService.shouldFail = true
        await viewModel.reloadCats()

        XCTAssertTrue(viewModel.cats.isEmpty)
        XCTAssert(viewModel.viewState == .error)
    }

    func testLoadMoreCatsSucess() async throws {
        await viewModel.reloadCats()
        await viewModel.loadMoreCats()

        XCTAssertEqual(viewModel.page, 1)
        XCTAssertEqual(viewModel.cats.count, 20)
        XCTAssertEqual(viewModel.viewState, .success)
    }

    func testFilterCatsByBreed() async throws {
        await viewModel.reloadCats()
        viewModel.filterCats(by: "s")

        XCTAssertEqual(viewModel.filteredCats.count, 7)
        XCTAssertEqual(viewModel.viewState, .success)
    }

    func testLoadMoreCatsFailure() async throws {
        await viewModel.reloadCats()
        mockService.shouldFail = true
        await viewModel.loadMoreCats()

        XCTAssertEqual(viewModel.page, 0)
        XCTAssertEqual(viewModel.cats.count, 10)
        XCTAssertEqual(viewModel.viewState, .error)
    }

    func testGetRatingValue() async throws {

        await viewModel.reloadCats()
        let cat = viewModel.cats.first
        let rating = viewModel.getRatingValue(cat: cat!)
        XCTAssertEqual(rating!, 3.77, accuracy: 0.01)
    }


}
