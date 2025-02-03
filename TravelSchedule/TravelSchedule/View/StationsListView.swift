//
//  StationsListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct StationsListView: View {
    @ObservedObject var viewModel: StationsListViewModel
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchString)
            if viewModel.filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .foregroundColor(.ypBlack)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(viewModel.filteredStations, id: \.self) { station in
                        Button(action: {
                            viewModel.selectStation(station)
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
    
}

