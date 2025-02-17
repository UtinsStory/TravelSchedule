//
//  TripsViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation
import Combine

@MainActor
final class TripsViewModel: ObservableObject {
    @Published var trips: [TripModel] = []
    @Published var filteredTrips: [TripModel] = []
    @Published var filtersApplied: Bool = false
    @Published var fromStation: StationModel?
    @Published var toStation: StationModel?
    @Published var fromStationCode: String?
    @Published var toStationCode: String?
    @Published var isLoading: Bool = false
    
    private let carriersViewModel: CarriersViewModel
    public let networkClient: NetworkClient
    
    init(carriersViewModel: CarriersViewModel, networkClient: NetworkClient) {
        self.carriersViewModel = carriersViewModel
        self.networkClient = networkClient
    }
    
    func loadTrips() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let trips = try await networkClient.searchRoutes(from: fromStationCode ?? "", to: toStationCode ?? "", date: "2025-01-30")
            DispatchQueue.main.async {
                            self.trips = trips
                            self.filteredTrips = trips
                        }
        } catch {
            ErrorView(errorType: .noInternet)
            print("Error loading trips: \(error)")
        }
    }
    
    func applyFilters(selectedTimes: Set<TimeIntervalEnum>, showTransfers: Bool?) {
        filteredTrips = trips.filter { trip in
            let matchesTime = selectedTimes.contains { interval in
                tripMatchesInterval(trip, interval: interval)
            }
            let matchesTransfer = showTransfers == nil || (showTransfers == false && trip.hasTransfers == false) || showTransfers == true
            return matchesTime && matchesTransfer
        }
        filtersApplied = !selectedTimes.isEmpty || showTransfers != nil
    }
    
    private func tripMatchesInterval(_ trip: TripModel, interval: TimeIntervalEnum) -> Bool {
        guard let departureTime = parseTime(trip.departureTime) else {
            return false
        }
        
        switch interval {
        case .morning:
            return isTime(departureTime, inRangeFrom: "08:00", to: "12:00")
        case .day:
            return isTime(departureTime, inRangeFrom: "12:00", to: "18:00")
        case .evening:
            return isTime(departureTime, inRangeFrom: "18:00", to: "00:00")
        case .night:
            return isTime(departureTime, inRangeFrom: "00:00", to: "06:00")
        }
    }
    
    private func parseTime(_ timeString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.date(from: timeString)
    }
    
    private func isTime(_ time: Date, inRangeFrom startTimeString: String, to endTimeString: String) -> Bool {
        guard
            let startTime = parseTime(startTimeString),
            let endTime = parseTime(endTimeString) else {
            return false
        }
        
        if startTime < endTime {
            return (startTime...endTime).contains(time)
        } else {
            return time >= startTime || time <= endTime
        }
    }
}
