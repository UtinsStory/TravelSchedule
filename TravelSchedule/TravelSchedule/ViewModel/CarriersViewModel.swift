//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

final class CarriersViewModel: ObservableObject {
    @Published var carriers: [CarrierModel] = []
    
    init() {
        loadCarriers()
    }
    
    func loadCarriers() {
        carriers = MockData.carriers
    }
    
    func carrier(for name: String) -> CarrierModel? {
        return carriers.first { $0.name == name }
    }
}
