//
//  ContentView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI
import SwiftData

struct ListCatView: View {
    @Environment(\.appGradient) private var gradient
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: ListCatViewModel
    @State var text = ""

    init(viewModel: ListCatViewModel) {
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
                            ListCatCellView<ListCatViewModel>(cat: cat)
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

extension ListCatView {

    struct ErrorView : View {
        var body: some View {
            VStack(spacing: 16) {
                Image(systemName: "key.slash.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 80)

                Text("API Key Not Found")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text("It seems the required API key is missing or invalid. Please check your API key configuration.")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
            .padding()
            .listRowBackground(Color.clear)
            .cornerRadius(15)
        }
    }
}
#Preview {
    ListCatView(viewModel: ListCatViewModel(service: CatApiService()))
        .modelContainer(for: FavoriteCat.self, inMemory: true)
}
