//
//  CatDetailsRectangleInformation.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import SwiftUI

struct CatDetailsRectangleInformation: View {
    var breed: BreedData

    init(breed: BreedData) {
        self.breed = breed
    }

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image("pawClear")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Breed")
                        .fontWeight(.bold)
                }
                Spacer()
                Text(breed.name)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .lineLimit(nil)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.brown.opacity(0.4))
            )

            VStack {
                HStack {
                    Image("weight-scale")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Weigth")
                        .fontWeight(.bold)
                }
                Spacer()
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(breed.weight.imperial) Lbs")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("\(breed.weight.metric) Kgs")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.brown.opacity(0.4))
            )

            VStack {
                HStack {
                    Image("lifeSpan")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Life span")
                        .fixedSize()
                        .fontWeight(.bold)
                }
                Spacer()
                if let lifeSpan = breed.lifeSpan {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(lifeSpan) years")
                            .font(.footnote)
                            .fontWeight(.bold)

                    }
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.brown.opacity(0.4))
            )

        }
        .padding(.horizontal,1)
        .frame(height: 100)
    }
}

#Preview {
    CatDetailsRectangleInformation(breed: BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian new york", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4))
}
