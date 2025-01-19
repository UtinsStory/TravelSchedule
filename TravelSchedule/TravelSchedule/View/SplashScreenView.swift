//
//  SplashScreenView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            MainScreenView()
        } else {
            Image("SplashScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
        }
    }
}

#Preview {
    SplashScreenView()
}
