//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Гена Утин on 22.01.2025.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(.closeButton)
        }
    }
}
