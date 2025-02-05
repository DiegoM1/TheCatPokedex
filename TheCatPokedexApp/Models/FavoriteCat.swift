//
//  FavoriteCat.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import SwiftData

protocol ModelDataProtocol {
    var cat: CatData { get }
}

@Model
final class FavoriteCat: ModelDataProtocol {
    var cat: CatData
    
    init(cat: CatData) {
        self.cat = cat
    }
}
