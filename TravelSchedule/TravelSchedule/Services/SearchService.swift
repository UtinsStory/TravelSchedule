//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.12.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias SearchResponse = Components.Schemas.SearchResponse

protocol SearchServiceProtocol {
    func searchSchedule(
        apiKey:String,
        from: String,
        to: String,
        format: String?,
        lang: String?,
        date: String?
    ) async throws -> SearchResponse
}

final class SearchService: SearchServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
      self.client = client
      self.apikey = apikey
    }
    
    func searchSchedule(apiKey: String, from: String, to: String, format: String?, lang: String?, date: String?) async throws -> SearchResponse {
        let response = try await client.searchRoutes(query: .init(
            apikey: apiKey,
            from: from,
            to: to,
            format: format,
            lang: lang,
            date: date))
        
        return try response.ok.body.json
    }
}