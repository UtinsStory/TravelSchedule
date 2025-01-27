//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Гена Утин on 27.01.2025.
//

import Foundation
import Combine

final class SettingsViewModel: ObservableObject {
    @Published var isDarkMode: Bool {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
        }
    }
    
    private let termsOfServiceURLString = "https://yandex.ru/legal/practicum_offer/"
    
    init(isDarkMode: Bool) {
        self.isDarkMode = isDarkMode
    }
    
    var termsOfServiceURL: URL? {
            return URL(string: termsOfServiceURLString)
        }
    
}
