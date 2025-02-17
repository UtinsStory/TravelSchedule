//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Гена Утин on 05.12.2024.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
