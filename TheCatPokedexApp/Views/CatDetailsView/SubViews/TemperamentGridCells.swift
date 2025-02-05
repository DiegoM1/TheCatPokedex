//
//  TemperamentGridCells.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftUI

struct TemperamentGridCells: View {
    var temperament: [String]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    init(temperament: String) {
        self.temperament = temperament.components(separatedBy: ", ")
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text("Temperament")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(temperament, id: \.self) { item in
                    Text(item)
                        .padding(4)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .background(Color.brown.opacity(0.3))
                        .cornerRadius(8)
                }
            }
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    TemperamentGridCells(temperament: "Adventurous, Playful, Curious")
}
