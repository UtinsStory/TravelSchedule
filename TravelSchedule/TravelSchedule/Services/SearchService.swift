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
        from: String,
        to: String,
        date: String
    ) async throws -> SearchResponse
}

actor SearchService: SearchServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
      self.client = client
      self.apikey = apikey
    }
    
    func searchSchedule(from: String, to: String, date: String) async throws -> SearchResponse {
        let response = try await client.searchRoutes(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            date: date,
            transfers: true))
        
        return try response.ok.body.json
    }
}
