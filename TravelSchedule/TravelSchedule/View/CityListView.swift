//
//  CityListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @StateObject private var viewModel = StationsViewModel()
    let selectAction: (String) -> Void
    @Binding var path: [Destination]
    let reachability = Reachability()
    
    var body: some View {
        if reachability.isConnectedToNetwork() == true {
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
        } else {
            ErrorView(errorType: .noInternet)
        }
    }
    
    var filteredCities: [CityModel] {
            viewModel.cities.filter { city in
                searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
            }
    }
}

