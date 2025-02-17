//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation
import Combine

@MainActor
final class CitiesViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    @Published var isLoading: Bool = false
    
    public let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func loadCities() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let cities = try await networkClient.fetchCities()
            self.cities = cities
        } catch {
            ErrorView(errorType: .noInternet)
            print("Error loading cities: \(error)")
        }
    }
}
