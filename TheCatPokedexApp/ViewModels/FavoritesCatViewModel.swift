//
//  FavoritesCatViewModel.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI
import SwiftData

/// View Model responsable of favories cat logic like showing cats from swiftData.
class FavoritesCatViewModel: CatCellViewModelProtocol {
    var modelContext: ModelContext?
    @Published var cats: [CatData] = []

    /// setup modelContext and fetch cats saved
    func onAppear(_ modelContext: ModelContext) {
        self.modelContext = modelContext
        let fetchDescriptor = FetchDescriptor<FavoriteCat>()
        let data = try? self.modelContext?.fetch(fetchDescriptor)
        cats = data?.compactMap { $0.cat } ?? []
    }

    /// Get general rating double to setup rating view.
    func getRatingValue(cat: CatData) -> Double? {
        guard let breed = cat.breeds.first else { return nil }
        let total = breed.affectionLevel + breed.childFriendly + breed.dogFriendly + breed.intelligence + breed.energyLevel + breed.socialNeeds + breed.hairless + breed.grooming + breed.strangerFriendly

        return Double(total) / 9.0
    }
}
