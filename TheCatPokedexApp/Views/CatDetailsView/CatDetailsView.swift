//
//  CatDetailsView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

struct CatDetailsView: View {
    @ObservedObject var viewModel: CatDetailsViewModel
    @Environment(\.modelContext) var modelContext
    @Environment(\.appGradient) private var gradient
    @Environment(\.dismiss) private var dismiss
    var height = UIScreen.main.bounds.height * 0.45
    var width = UIScreen.main.bounds.width

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                GeometryReader { geo in
                    let minY = geo.frame(in: .named("details")).minY
                    if let url = URL(string: viewModel.cat.url) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                        } placeholder: {
                            CustomLoadingView(border: false)
                                .padding()
                        }
                        .offset(y: minY > 0 ? -minY : 0)
                        .frame(height:  minY > 0 ? height + minY : height)
                    }
                }
                .frame(height: height)

                if let breed = viewModel.cat.breeds.first {
                    VStack(alignment: .center, spacing: 0) {
                        HStack {
                            Image("location")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.brown)
                            Text(breed.origin)
                                .font(.system(size: 32, weight: .bold))
                                .foregroundStyle(.black)
                            Spacer()
                            if let isFavorite = viewModel.isFavorite {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(isFavorite ? .red.opacity(0.8) : .black)
                                    .transition(.opacity)
                                    .onTapGesture {
                                        viewModel.handleFavoriteAction()
                                    }
                            }
                        }
                        .padding()

                        CatDetailsRectangleInformation(breed: breed)
                            .padding(.horizontal,4)
                            .accessibilityIdentifier("catInformation")

                        TemperamentGridCells(temperament: breed.temperament)
                            .accessibilityIdentifier("temperament")


                        QualityRating(breed: breed)
                            .accessibilityIdentifier("qualityRating")

                        CatDetailsMoreInfoView(breed: breed)
                            .accessibilityIdentifier("moreInfoUrls")
                            .padding()

                    }
                    .background(UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                        .fill(Gradient(colors: [.white, .brown.opacity(0.1)]))
                    )
                    .padding(.top, -50)
                }
            }
            .navigationDestination(for: URL.self, destination: { url in
                WebViewContainer(url: url)
            })
            .overlay(alignment: .topLeading) {
                GeometryReader { geo in
                    let minY = geo.frame(in: .named("details")).minY
                    Image(systemName: "arrowshape.backward.fill")
                        .accessibilityIdentifier("backButton")
                        .font(.system(size: 26, weight: .ultraLight))
                        .foregroundStyle(.black.opacity(0.8))
                        .onTapGesture {
                            dismiss()
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.brown.opacity(0.6))
                        )
                        .padding()
                        .offset(y: minY > 0 ? 50 - minY : 50)
                }
            }
            .onAppear {
                viewModel.modelContext = modelContext
                viewModel.checkIsFavorite()
            }
            .navigationBarBackButtonHidden(true)
        }
        .toolbar(.hidden, for: .tabBar)
        .accessibilityIdentifier("CatDetailsView")
        .coordinateSpace(name: "details")
        .frame(maxHeight: .infinity)
        .background(
            gradient
                .ignoresSafeArea(.all)
            )
    }
}

#Preview {
    CatDetailsView(viewModel: CatDetailsViewModel(cat: CatData(id: "9x1zk_Qdr", breeds: [BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian",cfaUrl: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg", vetstreetUrl: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4)], url: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg")))
        .ignoresSafeArea(.container, edges: .top)
}
