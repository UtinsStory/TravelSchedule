//
//  Mock.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

enum TimeIntervalEnum: String, CaseIterable {
    case morning = "Утро 08:00 - 12:00"
    case day = "День 12:00 - 18:00"
    case evening = "Вечер 18:00 - 00:00"
    case night = "Ночь 00:00 - 06:00"
}

enum MockData {
    static let carriers: [CarrierModel] = [
        CarrierModel(name: "РЖД", logoName: "RZD", email: "info@rzd.ru", phone: "+74952222222"),
        CarrierModel(name: "ФГК", logoName: "FGK", email: "info@fgk.ru", phone: "+74953333333"),
        CarrierModel(name: "Урал Логистика", logoName: "URAL", email: "info@ural.ru", phone: "+74954444444")
    ]
    
    static let trips: [TripModel] = {
        let rzd = carriers.first { $0.name == "РЖД" }!
        let fgk = carriers.first { $0.name == "ФГК" }!
        let ural = carriers.first { $0.name == "Урал Логистика" }!
        
        return [
            TripModel(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: rzd, hasTransfers: false, date: "23.04.2024"),
            TripModel(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: fgk, hasTransfers: true, date: "24.04.2024"),
            TripModel(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: ural, hasTransfers: false, date: "25.04.2024"),
            TripModel(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: rzd, hasTransfers: true, date: "26.04.2024")
        ]
    }()
    
    static let cities: [CityModel] = [
        CityModel(title: "Москва", stations: [
            StationModel(title: "Курский Вокзал"),
            StationModel(title: "Казанский Вокзал"),
            StationModel(title: "Киевский Вокзал"),
            StationModel(title: "Ленинградский Вокзал")
        ]),
        CityModel(title: "Санкт-Петербург", stations: [
            StationModel(title: "Московский Вокзал"),
            StationModel(title: "Витебский Вокзал"),
            StationModel(title: "Ладожский Вокзал"),
            StationModel(title: "Балтийский Вокзал")
        ]),
        CityModel(title: "Сочи", stations: [
            StationModel(title: "Вокзал Сочи"),
            StationModel(title: "Вокзал Адлер"),
            StationModel(title: "Вокзал Лазаревская")
        ]),
        CityModel(title: "Краснодар", stations: [
            StationModel(title: "Краснодар I"),
            StationModel(title: "Краснодар II")
        ])
    ]
}
