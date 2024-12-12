//
//  ThreadService.swift
//  TravelSchedule
//
//  Created by Гена Утин on 12.12.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias Thread = Components.Schemas.ThreadResponse

protocol ThreadServiceProtocol {
    func getThreadList(uid: String, date: String) async throws -> Thread
}

final class ThreadService: ThreadServiceProtocol {
    private let client: Client
    private let apiKey: String
    
    init(client: Client, apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getThreadList(uid: String, date: String) async throws -> Thread {
        let response = try await client.getThreadList(query: .init(
            apikey: apiKey,
            uid: uid,
            date: date
        ))
        return try response.ok.body.json
    }
}
