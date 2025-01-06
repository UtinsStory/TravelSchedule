//
//  SearchCityView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct SearchCityView: View {
    @Binding var path: NavigationPath
    @Binding var from: String
    @Binding var to: String
    let selectionType: SelectionType
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchCityView(path: .constant(NavigationPath()), from: .constant("Откуда"), to: .constant("Куда"), selectionType: .departure)
}
