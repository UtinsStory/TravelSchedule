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
        CarrierModel(name: "РЖД", logo: "RZD", email: "info@rzd.ru", phone: "+74952222222"),
        CarrierModel(name: "ФГК", logo: "FGK", email: "info@fgk.ru", phone: "+74953333333"),
        CarrierModel(name: "Урал Логистика", logo: "URAL", email: "info@ural.ru", phone: "+74954444444")
    ]
    
    static let trips: [Trip] = {
        let rzd = carriers.first { $0.name == "РЖД" }!
        let fgk = carriers.first { $0.name == "ФГК" }!
        let ural = carriers.first { $0.name == "Урал Логистика" }!
        
        return [
            Trip(departureTime: "08:00", arrivalTime: "12:00", travelTime: "4 часа", carrier: rzd, hasTransfers: false, date: "23.04.2024"),
            Trip(departureTime: "09:00", arrivalTime: "13:00", travelTime: "4 часа", carrier: fgk, hasTransfers: true, date: "24.04.2024"),
            Trip(departureTime: "10:00", arrivalTime: "14:00", travelTime: "4 часа", carrier: ural, hasTransfers: false, date: "25.04.2024"),
            Trip(departureTime: "11:00", arrivalTime: "15:00", travelTime: "4 часа", carrier: rzd, hasTransfers: true, date: "26.04.2024")
        ]
    }()
    
    static let cities: [City] = [
            City(title: "Москва", stations: [
                Station(title: "Курский Вокзал"),
                Station(title: "Казанский Вокзал"),
                Station(title: "Киевский Вокзал"),
                Station(title: "Ленинградский Вокзал")
            ]),
            City(title: "Санкт-Петербург", stations: [
                Station(title: "Московский Вокзал"),
                Station(title: "Витебский Вокзал"),
                Station(title: "Ладожский Вокзал"),
                Station(title: "Балтийский Вокзал")
            ]),
            City(title: "Сочи", stations: [
                Station(title: "Вокзал Сочи"),
                Station(title: "Вокзал Адлер"),
                Station(title: "Вокзал Лазаревская")
            ]),
            City(title: "Краснодар", stations: [
                Station(title: "Краснодар I"),
                Station(title: "Краснодар II")
            ])
            ]
}
