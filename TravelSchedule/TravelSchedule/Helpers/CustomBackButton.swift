//
//  CustomBackButton.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.ypBlack)
        }
    }
}
