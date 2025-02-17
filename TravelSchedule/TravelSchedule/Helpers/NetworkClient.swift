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
    private let dateFormatter = DateFormatterHelper()
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = Constants.apiKey
    }
    
    func fetchCities() async throws -> [CityModel] {
        let service = StationsListService(client: client, apikey: apikey)
        let stationList = try await service.getAllStations()
        
        var cities: [CityModel] = []
        for country in stationList.countries ?? [] {
            for region in country.regions ?? [] {
                for settlement in region.settlements ?? [] {
                    guard let cityTitle = settlement.title, !cityTitle.isEmpty else {
                        continue
                    }
                    let stations: [StationModel] = settlement.stations?.compactMap { station in
                        if let title = station.title, let code = station.codes?.yandex_code {
                            return StationModel(title: title, code: code)
                        }
                        return nil
                    } ?? []
                    let city = CityModel(title: cityTitle, stations: stations)
                    cities.append(city)
                }
            }
        }
        return cities
    }
    
    func searchRoutes(from: String, to: String, date: String) async throws -> [TripModel] {
        let service = SearchService(client: client, apikey: apikey)
        let searchResponse = try await service.searchSchedule(
            from: from,
            to: to,
            date: date
        )
        
        var trips: [TripModel] = []
        
        if let segments = searchResponse.segments {
            for segment in segments {
                if let fromStation = segment.from, let toStation = segment.to {
                    let trip = TripModel(
                        departureTime: dateFormatter.formatTime(dateString: segment.departure ?? ""),
                        arrivalTime: dateFormatter.formatTime(dateString: segment.arrival ?? ""),
                        travelTime: dateFormatter.formatTravelTime(seconds: segment.duration ?? 0),
                        carrier: CarrierModel(
                            name: segment.thread?.carrier?.title ?? "Неизвестный перевозчик",
                            logoName: segment.thread?.carrier?.logo ?? "RZD",
                            email: segment.thread?.carrier?.email ?? "неизвестный_email",
                            phone: segment.thread?.carrier?.phone ?? "неизвестный_телефон"
                        ),
                        hasTransfers: segment.has_transfers ?? false,
                        date: dateFormatter.formatDate(dateString: date)
                    )
                    trips.append(trip)
                }
            }
        }
        return trips
    }
}
