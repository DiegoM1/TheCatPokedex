//
//  CatApiServiceProtocol.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import Foundation

/// Cat api service protocol
protocol CatApiServiceProtocol {
    func fetchCatsWithBreedsInfo(limit: Int, page: Int) async throws -> [CatData]
}
