//
//  ListCatViewModel.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI
/// Protocol to make ListCatCellView suppot HomeCatViewModel and FavoriteCatViewModel
protocol CatCellViewModelProtocol: ObservableObject {
    func getRatingValue(cat: CatData) -> Double?
}

/// View Model responsable of Home cat view logic like filter, pagination, load cats.
class HomeCatViewModel: CatCellViewModelProtocol {
    @Published var cats: [CatData] = []
    @Published var viewState: ViewStatesEnum = .initialLoading
    @Published var filteredCats: [CatData] = []
    var page = 0
    var service: CatApiServiceProtocol

    init(service: CatApiServiceProtocol) {
        self.service = service
    }

    func filterCats(by text: String) {
        if text.isEmpty {
            filteredCats = cats
            return
        }
        filteredCats = cats.filter {
            $0.breeds.first?.name.lowercased().contains(text.lowercased()) ?? false
        }
    }

    /// Handle pagination fetching next page
    func loadMoreCats() async {
        page += 1
        await fetchCats(page: page, isRefreshing: false )
    }
    
    @MainActor
    private func fetchCats(page: Int = 0, isRefreshing: Bool) async {
        do {
            if !isRefreshing {
                viewState = .nextPageLoading
            }
            let newCats = try await service.fetchCatsWithBreedsInfo(limit: 10, page: page)
            if isRefreshing {
                cats = newCats
            } else {
                let setCats = Set(newCats)
                cats.append(contentsOf: Array(setCats))
            }
            filteredCats = cats
            viewState = .success
        } catch {
            viewState = .error
            if page > 0 {
                self.page -= 1
            }
        }
    }

    /// Handle first data fetch and pull to refresh
    func reloadCats() async {
        page = 0
        await fetchCats(page: page, isRefreshing: true)
    }

    func getRatingValue(cat: CatData) -> Double? {
        guard let breed = cat.breeds.first else { return nil }
        let total = breed.affectionLevel + breed.childFriendly + breed.dogFriendly + breed.intelligence + breed.energyLevel + breed.socialNeeds + breed.hairless + breed.grooming + breed.strangerFriendly

        return Double(total) / 9.0
    }
}
