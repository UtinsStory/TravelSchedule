//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

final class CitiesViewModel: ObservableObject {
    @Published var cities: [City]
    
    init() {
        self.cities = [
            City(title: "Москва", stations: [
                Station(title: "Курский Вокзал"),
                Station(title: "Казанский Вокзал"),
                Station(title: "Киевский Вокзал"),
                Station(title: "Ленинградский Вокзал")]),
            City(title: "Санкт-Петербург", stations: [
                Station(title: "Московский Вокзал"),
                Station(title: "Витебский Вокзал"),
                Station(title: "Ладожский Вокзал"),
                Station(title: "Балтийский Вокзал")]),
            City(title: "Сочи", stations: [
                Station(title: "Вокзал Сочи"),
                Station(title: "Вокзал Адлер"),
                Station(title: "Вокзал Лазаревская")])
        ]
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
