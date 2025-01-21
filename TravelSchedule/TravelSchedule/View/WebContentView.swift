//
//  WebContentView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct WebContentView: View {
    let url: URL
    
    var body: some View {
        WebView(url: url)
            .background(.ypWhite)
            .navigationTitle("Пользовательское соглашение")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
    }
}
