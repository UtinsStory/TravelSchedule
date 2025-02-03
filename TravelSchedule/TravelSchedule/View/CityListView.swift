//
//  CityListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @ObservedObject private var viewModel: CitiesViewModel
    var selectAction: (StationModel) -> Void
    @Binding var path: [Destination]
    
    init(viewModel: CitiesViewModel, selectAction: @escaping (StationModel) -> Void, path: Binding<[Destination]>) {
        self.viewModel = viewModel
        self.selectAction = selectAction
        self._path = path
    }
    
    var body: some View {
        
        VStack {
            SearchBarView(searchText: $searchString)
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                Spacer()
            } else if filteredCities.isEmpty {
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
                            if let city = viewModel.cities.first(where: { $0.title == city.title }) {
                                path.append(.stationList(city: city))
                            }
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
        .task {
            if viewModel.cities.isEmpty {
                await viewModel.loadCities()
            }
        }
        
    }
    
    var filteredCities: [CityModel] {
        viewModel.cities.filter { city in
            searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}

