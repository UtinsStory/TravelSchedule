//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

final class CitiesViewModel: ObservableObject {
    //    @Published var cities: [CityModel]
    //
    //    init() {
    //        self.cities = [
    //            CityModel(title: "Москва", stations: [
    //                StationModel(title: "Курский Вокзал"),
    //                StationModel(title: "Казанский Вокзал"),
    //                StationModel(title: "Киевский Вокзал"),
    //                StationModel(title: "Ленинградский Вокзал")]),
    //            CityModel(title: "Санкт-Петербург", stations: [
    //                StationModel(title: "Московский Вокзал"),
    //                StationModel(title: "Витебский Вокзал"),
    //                StationModel(title: "Ладожский Вокзал"),
    //                StationModel(title: "Балтийский Вокзал")]),
    //            CityModel(title: "Сочи", stations: [
    //                StationModel(title: "Вокзал Сочи"),
    //                StationModel(title: "Вокзал Адлер"),
    //                StationModel(title: "Вокзал Лазаревская")])
    //        ]
    //    }
    //
    //    func city(for station: String) -> String {
    //        for city in cities {
    //            if city.stations.contains(where: { $0.title == station }) {
    //                return city.title
    //            }
    //        }
    //        return ""
    //    }
    @Published var cities: [CityModel] = []
    
    init() {
        loadCities()
    }
    
    func loadCities() {
        cities = MockData.cities
    }
    
    func city(for station: String) -> String {
        for city in cities {
            if city.stations.contains(where: { $0.title == station }) {
                return city.title
            }
        }
        return ""
    }
    
}
