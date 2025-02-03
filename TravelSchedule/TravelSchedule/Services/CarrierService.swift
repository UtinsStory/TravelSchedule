//
//  CarrierService.swift
//  TravelSchedule
//
//  Created by Гена Утин on 12.12.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession

typealias Carriers = Components.Schemas.Carriers

protocol CarrierServiceProtocol {
    func getCarrierInfo(code: String) async throws -> Carriers
}

actor CarrierService: CarrierServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
      self.client = client
      self.apikey = apikey
    }
    
    func getCarrierInfo(code: String) async throws -> Carriers {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
}
