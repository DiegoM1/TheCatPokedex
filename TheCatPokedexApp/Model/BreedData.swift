//
//  BreedData.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import Foundation
struct Weight: Codable, Equatable, Hashable {
    var imperial: String
    var metric: String
}

struct BreedData: Codable, Equatable, Hashable {
    var weight: Weight
    var id: String
    var name: String
    var cfaUrl: String?
    var vetstreetUrl: String?
    var vcahospitalsUrl: String?
    var lifeSpan: String?
    var temperament: String
    var origin: String
    var countryCode: String
    var description: String
    var adaptability: Int
    var affectionLevel: Int
    var childFriendly: Int
    var dogFriendly: Int
    var energyLevel: Int
    var grooming: Int
    var healthIssues: Int
    var intelligence: Int
    var sheddingLevel: Int
    var socialNeeds: Int
    var strangerFriendly: Int
    var hairless: Int
    var wikipediaUrl: String?
}
