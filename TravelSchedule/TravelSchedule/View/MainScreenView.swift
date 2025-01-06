//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct MainScreenView: View {
    @State private var selectedTab: Int = 0
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                ScheduleView(path: $path)
                    .tabItem {
                        Image("ScheduleTabBarActive")
                            .renderingMode(.template)
                    }
                    .tag(0)
                SettingsView()
                    .tabItem {
                        Image("SettingsTabBarActive")
                            .renderingMode(.template)
                    }
                    .tag(1)
            }
        }
    }
}

#Preview {
    MainScreenView()
}
