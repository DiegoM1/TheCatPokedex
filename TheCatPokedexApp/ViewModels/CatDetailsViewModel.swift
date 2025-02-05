//
//  CatDetailsViewModel.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI
import SwiftData

/// View Model responsable of Cat details view logic like add, remove favorite cat
class CatDetailsViewModel: ObservableObject {
    var modelContext: ModelContext?
    @Published var cat: CatData
    @Published var isFavorite: Bool? = false

    init(cat: CatData) {
        self.cat = cat
    }

    func checkIsFavorite() {
        let fetchDescriptor = FetchDescriptor<FavoriteCat>()
        let data = try? modelContext?.fetch(fetchDescriptor)
        isFavorite = data?.contains(where: { $0.cat.id == cat.id })
    }

    func handleFavoriteAction() {
        if self.isFavorite ?? false {
            removeFromFavorites()
        } else {
            addToFavorites()
        }
    }

    private func addToFavorites() {
        let newFavoriteCat = FavoriteCat(cat: cat)
        modelContext?.insert(newFavoriteCat)

        withAnimation {
            do {
                try modelContext?.save()
                isFavorite = true
            } catch {
                print("Error saving favorite cat: \(error)")
            }
        }
    }

    private func removeFromFavorites() {
        let fetchDescriptor = FetchDescriptor<FavoriteCat>()
        let data = try? modelContext?.fetch(fetchDescriptor)

        if data?.contains(where: { $0.cat.id == cat.id }) ?? false {
            guard let catToDelete = data?.first (where: { $0.cat.id == cat.id }) else {
                return
            }
            modelContext?.delete(catToDelete)
        }

        withAnimation {
            do {
                try modelContext?.save()
                isFavorite = false
            } catch {
                print("Error saving favorite cat: \(error)")
            }
        }
    }


}
