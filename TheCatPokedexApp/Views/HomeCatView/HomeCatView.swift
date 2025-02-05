//
//  ContentView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI
import SwiftData

struct HomeCatView: View {
    @Environment(\.appGradient) private var gradient
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: HomeCatViewModel
    @State var text = ""

    init(viewModel: HomeCatViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                if viewModel.viewState == .initialLoading {
                    CustomLoadingView(border: false, backgroundColor: .clear)
                }
                
                List {
                    if viewModel.viewState == .error {
                        ErrorView()
                    }
                    
                    ForEach(viewModel.filteredCats) { cat in
                        NavigationLink(value: cat) {
                            ListCatCellView<HomeCatViewModel>(cat: cat)
                                .environmentObject(viewModel)
                                .onAppear {
                                    if let last = viewModel.cats.last, cat.id == last.id {
                                        Task {
                                            await viewModel.loadMoreCats()
                                        }
                                    }
                                }
                        }

                    }
                    .listRowBackground(Color.clear)

                    if viewModel.viewState == .nextPageLoading {
                        CustomLoadingView(border: false, backgroundColor: .clear)
                            .listRowBackground(Color.clear)
                            .accessibilityIdentifier("loadingNextPage")
                    }
                }
                .accessibilityIdentifier("catList")
            }
            .onChange(of: text, {
                viewModel.filterCats(by: text)
            })
            .refreshable {
                await viewModel.reloadCats()
            }
            .navigationTitle("The cat pokedex")
            .navigationDestination(for: CatData.self, destination: { cat in
                CatDetailsView(viewModel: CatDetailsViewModel(cat: cat))
                    .ignoresSafeArea(.container, edges: .top)
            })
            .scrollContentBackground(.hidden)
            .background(
                gradient
                    .edgesIgnoringSafeArea(.all)
            )
            .listStyle(.inset)
            .searchable(text: $text, prompt: Text("Search by breed"))
        }
        .task {
            if viewModel.cats.isEmpty {
                await viewModel.reloadCats()
            }
        }
    }
}

#Preview {
    HomeCatView(viewModel: HomeCatViewModel(service: CatApiService()))
        .modelContainer(for: FavoriteCat.self, inMemory: true)
}
