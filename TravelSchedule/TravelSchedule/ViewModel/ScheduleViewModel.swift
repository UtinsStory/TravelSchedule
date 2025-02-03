//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 27.01.2025.
//

import Foundation
import Combine

@MainActor
final class ScheduleViewModel: ObservableObject {
    @Published var fromStation: StationModel?
    @Published var toStation: StationModel?
    @Published var path: [Destination] = []
    @Published var selectedStory: StoryModel?
    @Published var currentStoryIndex: Int = 0
    @Published var stories: [StoryModel] = MockData.stories
    @Published var isStoriesViewPresented: Bool = false
    @Published var currentProgress: CGFloat = 0.0
    @Published var showTabBar: Bool = true
    
    private let citiesViewModel: CitiesViewModel
    private let tripsViewModel: TripsViewModel
    
    init(networkClient: NetworkClient) {
        self.citiesViewModel = CitiesViewModel(networkClient: networkClient)
        self.tripsViewModel = TripsViewModel(carriersViewModel: CarriersViewModel(), networkClient: networkClient)
    }
    
    func swapStations() {
        swap(&fromStation, &toStation)
        swap(&tripsViewModel.fromStation, &tripsViewModel.toStation)
        swap(&tripsViewModel.fromStationCode, &tripsViewModel.toStationCode)
    }
    
    func selectStory(_ story: StoryModel) {
        selectedStory = story
        currentStoryIndex = stories.firstIndex(where: { $0.id == story.id }) ?? 0
        currentProgress = CGFloat(currentStoryIndex) / CGFloat(stories.count)
        path.append(.storiesView)
        isStoriesViewPresented = true
    }
    
    func selectCityList(isFrom: Bool) {
        showTabBar = false
        path.append(isFrom ? .cityListFrom : .cityListTo)
    }
    
    func updateStation(_ station: StationModel, isFrom: Bool) {
        if isFrom {
            fromStation = station
            tripsViewModel.fromStation = station
            tripsViewModel.fromStationCode = station.code
        } else {
            toStation = station
            tripsViewModel.toStation = station
            tripsViewModel.toStationCode = station.code
        }
        showTabBar = true
        path.removeLast()
    }
    
    func resetPath() {
        path = []
    }
    
    var isSearchButtonEnabled: Bool {
        fromStation != nil && toStation != nil
    }
    
    var tripsViewModelInstance: TripsViewModel {
        tripsViewModel
    }
    
    var citiesViewModelInstance: CitiesViewModel {
        citiesViewModel
    }
}
