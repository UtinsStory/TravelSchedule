//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Гена Утин on 12.12.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.CopyrightResponse

protocol CopyrightServiceProtocol {
    func getCopyrightInfo() async throws -> Copyright
}

actor CopyrightService: CopyrightServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
      self.client = client
      self.apikey = apikey
    }
    
    func getCopyrightInfo() async throws -> Copyright {
        let response = try await client.getCopyrightInfo(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
