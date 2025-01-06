//
//  FromToTextView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct FromToTextView: View {
    @Binding var type: String
    
    var body: some View {
        Text(type)
            .font(.system(size: 17))
            .foregroundStyle(type == "Откуда" || type == "Куда" ? .ypGray : .ypBlackUniversal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(1)
            .padding(.horizontal)
    }
}

#Preview {
    FromToTextView(type: .constant("Откуда"))
}
