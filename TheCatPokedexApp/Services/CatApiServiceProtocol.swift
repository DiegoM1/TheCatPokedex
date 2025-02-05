//
//  CatApiServiceProtocol.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import Foundation

protocol CatApiServiceProtocol {
    func fetchCatsWithBreedsInfo(limit: Int, page: Int) async throws -> [CatData]
}
