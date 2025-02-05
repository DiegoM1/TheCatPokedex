//
//  CatApiServiceMock.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 4/02/25.
//

import Foundation

/// Cat api service mock for UnitTests purposes
class CatApiServiceMock: CatApiServiceProtocol {
    private let defaultUrl = "https://api.thecatapi.com/"
    var shouldFail: Bool = false

    func fetchCatsWithBreedsInfo(limit: Int = 10, page: Int = 0) async throws -> [CatData] {
        guard let _ = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            throw NSError(domain: "API_KEY_NOT_FOUND", code: 0, userInfo: nil)
        }
        
        if shouldFail {
            throw NSError(domain: "Mock Error", code: 0, userInfo: nil)
        }

        if page > 0 {
            try await Task.sleep(nanoseconds: 5_000_000_000)
        }

        if let url: URL = Bundle.main.url(forResource: page == 0 ? "CatsMockData" : "CatsPageMockData", withExtension: "json") {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let catsData = try decoder.decode([CatData].self, from: data)
            return catsData
        }

        throw NSError(domain: "Mock Error", code: 0, userInfo: nil)
    }

    private func endpoint(limit: Int, page: Int) -> String {
        return "v1/images/search?size=med&has_breeds=true&page=\(page)&limit=\(limit)"
    }
}
