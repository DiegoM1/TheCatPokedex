//
//  ListFavoritesCat.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI
import SwiftData

struct ListFavoritesCat: View {
    @Environment(\.appGradient) private var gradient
    @ObservedObject var viewModel: FavoritesCatViewModel
    @Query private var favoriteCats: [FavoriteCat]
    @Environment(\.modelContext) var model

    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.cats.isEmpty {
                    ContentUnavailableView {
                        Label("No cats liked yet", systemImage: "heart.slash")
                    } description: {
                        Text("Go to details and hit that heart icon!")
                            .fontWeight(.semibold)
                    }
                    .accessibilityIdentifier("emptyFavoritesCats")
                } else {
                    List {
                        ForEach(viewModel.cats) { cat in
                            NavigationLink(value: cat) {
                                ListCatCellView<FavoritesCatViewModel>(viewModel: viewModel, cat: cat)
                            }
                        }
                        .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .accessibilityIdentifier("favoriteCatList")
                    .navigationDestination(for: CatData.self) { cat in
                        CatDetailsView(viewModel: CatDetailsViewModel(cat: cat))
                            .ignoresSafeArea(.container, edges: .top)
                    }
                    .background(
                        gradient
                            .ignoresSafeArea(.container, edges: .top)
                    )
                }
            }
            .onAppear(perform: {
                viewModel.onAppear(model)
            })
            .navigationTitle("Favorite Cats")
            .background(
                gradient
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

#Preview {
    ListFavoritesCat(viewModel: FavoritesCatViewModel())
}
