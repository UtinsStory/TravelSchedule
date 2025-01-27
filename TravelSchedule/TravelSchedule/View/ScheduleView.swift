//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI
import Combine

struct ScheduleView: View {
    @ObservedObject var viewModel = ScheduleViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack {
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.stories) { story in
                            StoryPreview(story: story)
                                .onTapGesture {
                                    viewModel.selectStory(story)
                                }
                        }
                    }
                    .padding()
                }
                .padding(.top, -310)
                
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
                                TextField("Откуда", text: $viewModel.fromStation, prompt: Text("Откуда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .simultaneousGesture(TapGesture().onEnded { viewModel.selectCityList(isFrom: true)})
                                
                                
                                TextField("Куда", text: $viewModel.toStation, prompt: Text("Куда").foregroundColor(.ypGray))
                                    .padding(.leading, 10)
                                    .frame(height: 40)
                                    .background(Color.ypWhiteUniversal)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.ypBlackUniversal)
                                    .simultaneousGesture(TapGesture().onEnded { viewModel.selectCityList(isFrom: false)})
                                
                            }
                        }
                        .cornerRadius(20)
                        .padding(.leading, 20)
                        Button(action: {
                            viewModel.swapStations()
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
                .padding()
                .padding(.top, -120)
                if viewModel.isSearchButtonEnabled {
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
                viewModel.showTabBar = true
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .cityListFrom:
                    CityListView(selectAction: { selectedStation in
                        viewModel.updateStation(selectedStation, isFrom: true)
                    }, path: $viewModel.path)
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .cityListTo:
                    CityListView(selectAction: { selectedStation in
                        viewModel.updateStation(selectedStation, isFrom: false)
                    }, path: $viewModel.path)
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .stationList(let city):
                    StationsListView(stations: viewModel.citiesViewModelInstance.cities.first(where: { $0.title == city })?.stations ?? [], selectAction: { station in
                        if viewModel.path.contains(.cityListFrom) {
                            viewModel.updateStation(station, isFrom: true)
                        } else {
                            viewModel.updateStation(station, isFrom: false)
                        }
                        viewModel.resetPath()
                    })
                    .onAppear {
                        viewModel.showTabBar = true
                    }
                case .tripsListView:
                    let fromCity = viewModel.citiesViewModelInstance.city(for: viewModel.fromStation)
                    let toCity = viewModel.citiesViewModelInstance.city(for: viewModel.toStation)
                    TripsListView(viewModel: viewModel.tripsViewModelInstance, fromCity: fromCity, fromStation: viewModel.fromStation, toCity: toCity, toStation: viewModel.toStation, path: $viewModel.path)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .tripFilterView:
                    TripFilterView(viewModel: viewModel.tripsViewModelInstance)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .carrierDetail(let carrier):
                    CarrierInfoView(carrier: carrier)
                        .onAppear {
                            viewModel.showTabBar = true
                        }
                case .storiesView:
                    StoriesView(stories: $viewModel.stories, isPresented: $viewModel.isStoriesViewPresented, currentStoryIndex: viewModel.currentStoryIndex, currentProgress: $viewModel.currentProgress)
                        .onAppear {
                            viewModel.showTabBar = true
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
