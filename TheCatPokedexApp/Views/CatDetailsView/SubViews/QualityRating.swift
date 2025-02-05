//
//  QualityRating.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

struct QualityRating: View {
    var breed: BreedData

    init(breed: BreedData) {
        self.breed = breed
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Quality Ratings")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            HStack {
                Text("Adaptability")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.adaptability)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)

            HStack {
                Text("Child friendly")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                LineRatingView(rating: breed.childFriendly)
            }
            .padding()

            HStack {
                Text("Energy Level")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.energyLevel)
            }
            .padding()

            HStack {
                Text("Affection level")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.affectionLevel)
            }
            .padding()

            HStack {
                Text("Dog Friendly")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.dogFriendly)
            }
            .padding()

            HStack {
                Text("Grooming")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.grooming)
            }
            .padding()

            HStack {
                Text("hairless")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.hairless)
            }
            .padding()

            HStack {
                Text("Adaptability")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                LineRatingView(rating: breed.adaptability)
            }
            .padding()
        }
    }
}

#Preview {
    QualityRating(breed: BreedData(weight: Weight(imperial: "7  -  10", metric: "7  -  10"), id: "Abys", name: "Abyssinian new york", cfaUrl: "https://en.wikipedia.org/wiki/Burmese_(cat)", lifeSpan: "11 - 15", temperament: "Active, Energetic, Independent, Intelligent, Gentle", origin: "Egypt", countryCode: "EG", description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.", adaptability: 2, affectionLevel: 2, childFriendly: 3, dogFriendly: 4, energyLevel: 5, grooming: 0, healthIssues: 1, intelligence: 3, sheddingLevel: 2, socialNeeds: 0, strangerFriendly: 4, hairless: 4))
}
