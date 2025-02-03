//
//  CarriersViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 10.01.2025.
//

import Foundation

@MainActor
final class CarriersViewModel: ObservableObject {
    @Published var carriers: [CarrierModel] = []
    
    func carrier(for name: String) -> CarrierModel? {
        return carriers.first { $0.name == name }
    }
}
