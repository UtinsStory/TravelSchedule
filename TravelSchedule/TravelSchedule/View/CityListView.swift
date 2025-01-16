//
//  CityListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @StateObject var viewModel = StationsViewModel()
    var selectAction: (String) -> Void
    @Binding var path: [Destination]
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchString)
            if filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(filteredCities) { city in
                        Button(action: {
                            path.append(.stationList(city: city.title))
                        }) {
                            HStack {
                                Text(city.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.ypWhite)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Города")
    }
    
    var filteredCities: [City] {
        viewModel.cities.filter { city in
            searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}

