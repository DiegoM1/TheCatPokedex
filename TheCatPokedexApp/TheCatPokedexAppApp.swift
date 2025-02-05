//
//  TheCatPokedexAppApp.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI
import SwiftData

@main
struct TheCatPokedexAppApp: App {
    @StateObject private var viewModel: ListCatViewModel

    init() {
        if ProcessInfo.processInfo.arguments.contains("UITesting") {
            let mockService = CatApiServiceMock()
            _viewModel = StateObject(wrappedValue: ListCatViewModel(service: mockService))
        } else {
            let realService = CatApiService()
            _viewModel = StateObject(wrappedValue: ListCatViewModel(service: realService))
        }
    }


    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            FavoriteCat.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: ProcessInfo.processInfo.arguments.contains("UITesting") ? true : false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {

            TabView {
                Tab("Home", systemImage: "house") {
                    ListCatView(viewModel: viewModel)
                }
                .accessibilityIdentifier("Home")

                Tab("Favorites", systemImage: "heart.fill") {
                    ListFavoritesCat(viewModel: FavoritesCatViewModel())
                }
                .accessibilityIdentifier("Favorites")
            }
            .tint(.indigo)
            .environment(\.appGradient, LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.brown.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))

        }
        .modelContainer(sharedModelContainer)
    }
}
