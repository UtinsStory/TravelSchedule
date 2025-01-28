//
//  CityListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CityListView: View {
    @State private var searchString = ""
    @StateObject private var viewModel: CitiesViewModel
    var selectAction: (String) -> Void
    @Binding var path: [Destination]
    let reachability = Reachability()
    
    init(selectAction: @escaping (String) -> Void, path: Binding<[Destination]>, networkClient: NetworkClient) {
        _viewModel = StateObject(wrappedValue: CitiesViewModel(networkClient: networkClient))
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
        .task {
            await viewModel.loadCities()
        }
        
    }
    
    var filteredCities: [CityModel] {
        viewModel.cities.filter { city in
            searchString.isEmpty || city.title.localizedCaseInsensitiveContains(searchString)
        }
    }
}

