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
    @Published var selectedStation: StationModel?
    @Published var stations: [StationModel] = []
    
    var selectAction: (StationModel) -> Void
    
    init(stations: [StationModel], selectAction: @escaping (StationModel) -> Void) {
        self.stations = stations
        self.selectAction = selectAction
    }
    
    var filteredStations: [StationModel] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    func selectStation(_ station: StationModel) {
        selectedStation = station
        selectAction(station)
    }
}
