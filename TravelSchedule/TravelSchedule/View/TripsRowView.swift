//
//  TripsRowView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct TripRowView: View {
    var trip: TripModel
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.ypLightGray)
                .frame(height: 104)
                .cornerRadius(24)
            VStack{
                HStack{
                    Image(trip.carrier.logoName)
                        .resizable()
                        .cornerRadius(12)
                        .frame(width: 38, height: 38)
                        .padding(.leading, 16)
                    VStack(alignment: .leading) {
                        Text(trip.carrier.name)
                            .font(.system(size: 17))
                            .foregroundStyle(.ypBlackUniversal)
                        if trip.hasTransfers {
                            Text("С пересадкой в Костроме")
                                .font(.system(size: 12))
                                .foregroundStyle(.ypRed)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    Text(formatDate(trip.date))
                        .padding(.trailing, 16)
                        .offset(y: -5)
                        .font(.system(size: 12))
                        .foregroundStyle(.ypBlackUniversal)
                    
                }
                HStack {
                    Text(trip.departureTime)
                        .padding(.leading, 16)
                        .font(.system(size: 17))
                        .foregroundStyle(.ypBlackUniversal)
                    Spacer()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Spacer()
                    Text(trip.travelTime)
                        .font(.system(size: 12))
                        .foregroundStyle(.ypBlackUniversal)
                    Spacer()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.ypGray)
                    Spacer()
                    Text(trip.arrivalTime)
                        .padding(.trailing, 16)
                        .font(.system(size: 17))
                        .foregroundStyle(.ypBlackUniversal)
                }
                .padding(.top, 8)
            }
        }
    }
    
    func formatDate(_ dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.dateFormat = "d MMMM"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            return dateFormatter.string(from: date)
        }
        return dateStr
    }
}
