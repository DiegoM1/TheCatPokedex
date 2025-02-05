//
//  CatApiService.swift
//  TheCatPokedexApp
//
//  Created by Diego Monteagudo Diaz on 3/02/25.
//

import Foundation

/// Cat api service handle api calls to fetch cats data
class CatApiService: CatApiServiceProtocol {
    private let defaultUrl = "https://api.thecatapi.com/"

    func fetchCatsWithBreedsInfo(limit: Int = 10, page: Int = 0) async throws -> [CatData] {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            throw NSError(domain: "API_KEY_NOT_FOUND", code: 0, userInfo: nil)  
        }

        guard let url = URL(string: "\(defaultUrl)\(endpoint(limit: limit, page: page))") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let catsData = try decoder.decode([CatData].self, from: data)
        
        return catsData
    }

    private func endpoint(limit: Int, page: Int) -> String {
        return "v1/images/search?size=med&has_breeds=true&page=\(page)&limit=\(limit)"
    }
}
