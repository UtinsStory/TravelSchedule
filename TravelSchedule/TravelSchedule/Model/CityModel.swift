//
//  CityModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

struct CityModel: Identifiable {
    let id = UUID()
    let title: String
    let stations: [StationModel]
}
