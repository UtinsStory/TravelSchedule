//
//  ScheduleService.swift
//  TravelSchedule
//
//  Created by Гена Утин on 12.12.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias ScheduleResponse = Components.Schemas.ScheduleResponse

protocol ScheduleServiceProtocol {
    func getSchedule(
        station: String,
        date: String
    ) async throws -> ScheduleResponse
}

actor ScheduleService: ScheduleServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getSchedule(station: String, date: String) async throws -> ScheduleResponse {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apiKey,
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
}



