//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

struct ScheduleView: View {
    @State private var fromStation = ""
    @State private var toStation = ""
    @State private var path: [Destination] = []
    @StateObject var citiesViewModel = StationsViewModel()
    @StateObject var tripsViewModel = TripsViewModel(carriersViewModel: CarriersViewModel())
    @Binding var showTabBar: Bool
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.ypBlue)
                        .cornerRadius(20)
                        .frame(height: 128)
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.ypWhiteUniversal)
                                .frame(height: 100)
                            VStack {
                                TextField("Откуда", text: $fromStation, prompt: Text("Откуда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListFrom)
                                    }
                                
                                TextField("Куда", text: $toStation, prompt: Text("Куда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .onTapGesture {
                                        showTabBar = false
                                        path.append(.cityListTo)
                                    }
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            swap(&fromStation, &toStation)
                        }) {
                            Image("ReverseButton")
                                .frame(width: 36, height: 36)
                                .background(Circle().fill(Color.white))
                                .buttonStyle(RotateButtonStyle())
                                .padding(10)
                        }
                        Spacer()
                    }
                }
                .padding(16)
                if !fromStation.isEmpty && !toStation.isEmpty {
                    NavigationLink(value: Destination.tripsListView) {
                        Text("Найти")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.ypBlue)
                            .cornerRadius(16)
                    }
                    
                    .frame(width: 150, height: 60)
                    .background(Color.ypBlue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                }
                Spacer()
            }
            .onAppear {
                showTabBar = true
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .cityListFrom:
                    CityListView(selectAction: { selectedStation in
                        fromStation = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                    .onAppear {
                        showTabBar = true
                    }
                case .cityListTo:
                    CityListView(selectAction: { selectedStation in
                        toStation = selectedStation
                        showTabBar = true
                        path.removeLast()
                    }, path: $path)
                    .onAppear {
                        showTabBar = true
                    }
                case .stationList(let city):
                    StationsListView(stations: citiesViewModel.cities.first(where: { $0.title == city })?.stations ?? [], selectAction: { station in
                        if path.contains(.cityListFrom) {
                            fromStation = station
                        } else {
                            toStation = station
                        }
                        showTabBar = true
                        path = []
                    })
                    .onAppear {
                        showTabBar = true
                    }
                case .tripsListView:
                    let fromCity = citiesViewModel.city(for: fromStation)
                    let toCity = citiesViewModel.city(for: toStation)
                    TripsListView(viewModel: tripsViewModel, fromCity: fromCity, fromStation: fromStation, toCity: toCity, toStation: toStation, path: $path)
                        .onAppear {
                            showTabBar = true
                        }
                case .tripFilterView:
                    TripFilterView(viewModel: tripsViewModel)
                        .onAppear {
                            showTabBar = true
                        }
                case .carrierDetail(let carrier):
                    CarrierInfoView(carrier: carrier)
                        .onAppear {
                            showTabBar = true
                        }
                }
                
            }
            
        }
        .background(Color.ypWhite)
        .edgesIgnoringSafeArea(.all)
    }
}
struct RotateButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .rotationEffect(configuration.isPressed ? -Angle(radians: .pi) : .zero)
    }
}

#Preview {
    MainScreenView()
}
