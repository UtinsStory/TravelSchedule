//
//  StationModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

struct StationModel: Identifiable, Hashable, Sendable {
    let id = UUID()
    let title: String
    let code: String
}
