//
//  MainScreenView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct MainScreenView: View {
    @State private var showTabBar = true
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some View {
        NavigationStack {
            TabView {
                ScheduleView(showTabBar: $showTabBar)
                    .tabItem {
                        Image("ScheduleTabBarActive")
                            .renderingMode(.template)
                    }
                SettingsView(isDarkMode: $isDarkMode)
                    .tabItem {
                        Image("SettingsTabBarActive")
                            .renderingMode(.template)
                    }
            }
            .onAppear(){
                UITabBar.appearance().backgroundColor = .ypWhite
            }
            .tint(.ypBlack)
            .onChange(of: showTabBar) { newValue in
                if !newValue {
                    hideTabBar()
                } else {
                    showTabBarAgain()
                }
            }
        }
    }
    
    private func hideTabBar() {
        UITabBar.appearance().isHidden = true
    }
    
    private func showTabBarAgain() {
        UITabBar.appearance().isHidden = false
    }
}

#Preview {
    MainScreenView()
}
