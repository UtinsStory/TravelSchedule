//
//  StationsListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct StationsListView: View {
    @State private var searchString = ""
    @State private var selectedStation: String?
    var stations: [StationModel]
    var selectAction: (String) -> Void
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchString)
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(filteredStations, id: \.self) { station in
                        Button(action: {
                            selectedStation = station.title
                            selectAction(station.title)
                        }) {
                            HStack {
                                Text(station.title)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.ypBlack)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                    .listRowBackground(Color.ypWhite)
                }
                .background(.ypWhite)
                .listStyle(.plain)
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Выбор Станции")
    }
    
    var filteredStations: [StationModel] {
        stations.filter { station in
            searchString.isEmpty || station.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}

