//
//  TripsListView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct TripsListView: View {
    @ObservedObject var viewModel: TripsViewModel
    @Binding var path: [Destination]
    
    var body: some View {
        VStack {
            Text("\(viewModel.fromStation?.title ?? "") → \(viewModel.toStation?.title ?? "")")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else if viewModel.filteredTrips.isEmpty {
                Spacer()
                Text("Вариантов нет")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.ypBlack)
                    .padding()
                Spacer()
            } else {
                List(viewModel.filteredTrips) { trip in
                    Button(action: {
                        path.append(.carrierDetail(trip.carrier))
                    }) {
                        TripRowView(trip: trip)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.ypWhite)
                }
                .background(.ypWhite)
                .listStyle(.plain)
            }
            
            NavigationLink(value: Destination.tripFilterView) {
                HStack {
                    Text("Уточнить время")
                        .foregroundColor(.white)
                    
                    if viewModel.filtersApplied {
                        Circle()
                            .fill(Color.ypRed)
                            .frame(width: 8, height: 8)
                            .padding(.leading, 4)
                    }
                }
                .padding()
                .frame(width: 343, height: 60)
                .background(Color.ypBlue)
                .cornerRadius(16)
            }
            .padding()
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .task {
            if viewModel.filteredTrips.isEmpty {
                await viewModel.loadTrips()
            }
        }
    }
}

