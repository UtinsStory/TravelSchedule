//
//  Destination.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

enum Destination: Hashable {
    case cityListFrom
    case cityListTo
    case stationList(city: String)
    case tripsListView
    case tripFilterView
    case carrierDetail(CarrierModel)
    
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        switch (lhs, rhs) {
        case (.cityListFrom, .cityListFrom),
            (.cityListTo, .cityListTo),
            (.tripsListView, .tripsListView),
            (.tripFilterView, .tripFilterView):
            return true
        case (.stationList(let lhsCity), .stationList(let rhsCity)):
            return lhsCity == rhsCity
        case (.carrierDetail(let lhsCarrier), .carrierDetail(let rhsCarrier)):
            return lhsCarrier == rhsCarrier
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .cityListFrom:
            hasher.combine("cityListFrom")
        case .cityListTo:
            hasher.combine("cityListTo")
        case .stationList(let city):
            hasher.combine(city)
        case .tripsListView:
            hasher.combine("tripsListView")
        case .tripFilterView:
            hasher.combine("tripFilterView")
        case .carrierDetail(let carrier):
            hasher.combine(carrier)
        }
    }
}
