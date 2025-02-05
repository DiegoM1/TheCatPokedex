//
//  ListCatCellView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

struct ListCatCellView<ViewModel: CatCellViewModelProtocol>: View {
    @EnvironmentObject var viewModel: ViewModel
    var cat: CatData

    init(cat: CatData) {
        self.cat = cat
    }

    var body: some View {
        HStack {
            if let imageUrl = URL(string: cat.url) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 5)
                } placeholder: {
                    CustomLoadingView()
                }
                .frame(width: 150, height: 150)
                .fixedSize()
            }
            if let breed = cat.breeds.first {
                VStack(alignment: .leading, spacing: 8) {
                    if let rating = viewModel.getRatingValue(cat: cat) {
                        StarRatingView(rating: rating)
                    }
                    Text(breed.name)
                        .font(.title)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    Text(breed.origin)
                        .font(.subheadline)
                        .fontWeight(.light)
                        .frame(alignment: .leading)


                    Text("\(breed.weight.imperial) Pounds")
                        .font(.caption)
                        .fontWeight(.bold)
                    Text("\(breed.weight.metric) Kilograms")
                        .font(.caption)
                        .fontWeight(.bold)
                }
                .padding(.leading, 12)
            }

            Spacer()
        }
    }
}

#Preview {
    ListCatCellView<ListCatViewModel>(cat: CatData(id: "9x1zk_Qdr", breeds: [BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4)], url: "https://cdn2.thecatapi.com/images/9x1zk_Qdr.jpg"))
        .environmentObject(ListCatViewModel(service: CatApiService()))
}
