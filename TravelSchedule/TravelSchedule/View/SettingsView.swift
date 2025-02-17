//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle("Темная тема", isOn: $viewModel.isDarkMode)
                .padding()
                .tint(.ypBlue)
            if let url = viewModel.termsOfServiceURL {
                NavigationLink(destination: WebContentView(url: url)) {
                    HStack {
                        Text("Пользовательское соглашение")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .padding()
            } else {
                Text("Недоступно")
                    .padding()
            }
            Spacer()
            Text("Приложение использует API «Яндекс.Расписания»")
                .font(.system(size: 12))
                .padding()
            Text("Версия 1.0 Beta")
                .font(.system(size: 12))
                .padding()
        }
        .padding()
        .background(.ypWhite)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(isDarkMode: false))
    }
}
