//
//  CatDetailsMoreInfoView.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

struct CatDetailsMoreInfoView: View {
    var breed: BreedData

    init(breed: BreedData) {
        self.breed = breed
    }

    var body: some View {
        VStack {
            Text("More Information")
                .font(.subheadline)
                .fontWeight(.bold)
            HStack {
                if let cfaUrl = breed.cfaUrl, let url = URL(string: cfaUrl) {
                    NavigationLink(value: url) {
                        Image("cfa")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                if let vetstreetUrl = breed.vetstreetUrl, let url = URL(string: vetstreetUrl) {
                    NavigationLink(value: url) {
                        Image("greatPetCare")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                if let vcahospitalsUrl = breed.vcahospitalsUrl, let url = URL(string: vcahospitalsUrl) {
                    NavigationLink(value: url) {
                        Image("vca")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                if let wikipediaUrl = breed.wikipediaUrl, let url = URL(string: wikipediaUrl) {
                    NavigationLink(value: url) {
                        Image("wikipedia")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    CatDetailsMoreInfoView(breed: BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian new york", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4))
}
