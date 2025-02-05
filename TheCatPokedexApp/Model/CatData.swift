//
//  CatData.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import Foundation

struct CatData: Codable, Identifiable, Hashable {
    var id: String
    var breeds: [BreedData]
    var url: String
}

