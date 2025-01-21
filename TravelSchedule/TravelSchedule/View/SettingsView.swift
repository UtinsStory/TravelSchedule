//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isDarkMode: Bool
    let termsOfServiceURLString = "https://yandex.ru/legal/practicum_offer/"
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle("Темная тема", isOn: $isDarkMode)
                .padding()
                .tint(.ypBlue)
            if let url = URL(string: termsOfServiceURLString) {
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

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
