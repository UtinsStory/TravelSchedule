//
//  NetworkClient.swift
//  TravelSchedule
//
//  Created by Гена Утин on 28.01.2025.
//

import Foundation

actor NetworkClient {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func fetchStations() async throws -> [CityModel] {
        let service = StationsListService(client: client, apikey: apikey)
        let stationList = try await service.getAllStations()
        
        var cities: [CityModel] = []
        for country in stationList.countries ?? [] {
            for region in country.regions ?? [] {
                for settlement in region.settlements ?? [] {
                    guard let cityTitle = settlement.title, !cityTitle.isEmpty else {
                        continue
                    }
                    let stations = settlement.stations?.compactMap { $0.title != nil ? StationModel(title: $0.title!) : nil } ?? []
                    let city = CityModel(title: cityTitle, stations: stations)
                    cities.append(city)
                }
            }
        }
        return cities
    }
}
