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
        let settingsViewModel = SettingsViewModel(isDarkMode: isDarkMode)
        
        NavigationStack {
            TabView {
                Group {
                    ScheduleView(showTabBar: $showTabBar)
                        .tabItem {
                            Image("ScheduleTabBarActive")
                                .renderingMode(.template)
                        }
                    SettingsView(viewModel: settingsViewModel)
                        .tabItem {
                            Image("SettingsTabBarActive")
                                .renderingMode(.template)
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.ypWhite, for: .tabBar)
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
            .onChange(of: isDarkMode) { newValue in
                settingsViewModel.isDarkMode = newValue
            }
            .onChange(of: settingsViewModel.isDarkMode) { newValue in
                isDarkMode = newValue
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
