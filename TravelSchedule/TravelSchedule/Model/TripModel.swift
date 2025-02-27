//
//  TripModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

struct TripModel: Identifiable, Sendable {
    let id = UUID()
    let departureTime: String
    let arrivalTime: String
    let travelTime: String
    let carrier: CarrierModel
    let hasTransfers: Bool
    let date: String
}
