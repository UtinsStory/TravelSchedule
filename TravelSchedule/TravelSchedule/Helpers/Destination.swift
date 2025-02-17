//
//  Destination.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

enum Destination: Hashable, Equatable {
    case cityListFrom
    case cityListTo
    case stationList(city: CityModel)
    case tripsListView
    case tripFilterView
    case carrierDetail(CarrierModel)
    case storiesView
}
