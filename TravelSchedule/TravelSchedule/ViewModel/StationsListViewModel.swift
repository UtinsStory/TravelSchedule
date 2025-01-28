//
//  StationsListViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 28.01.2025.
//

import Foundation
import Combine

final class StationsListViewModel: ObservableObject {
    @Published var searchString: String = ""
    @Published var selectedStation: String?
    @Published var stations: [StationModel] = []
    
    var selectAction: (String) -> Void
    
    init(stations: [StationModel], selectAction: @escaping (String) -> Void) {
        self.stations = stations
        self.selectAction = selectAction
    }
    
    var filteredStations: [StationModel] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func selectStation(_ station: String) {
        selectedStation = station
        selectAction(station)
    }
}
