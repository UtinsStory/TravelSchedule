//
//  ScheduleView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 06.01.2025.
//

import SwiftUI

enum SelectionType {
    case departure
    case arrival
    case find
}
struct ScheduleView: View {
    @Binding var path: NavigationPath
    @State private var from = "Откуда"
    @State private var to = "Куда"
    @State private var isClicked = false
    @State private var isFindButtonTapped = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack() {
                Rectangle()
                    .fill(.ypBlue)
                HStack(spacing: 16) {
                    VStack {
                        Spacer()
                        NavigationLink(value: SelectionType.departure) {
                            FromToTextView(type: $from)
                        }
                        Spacer()
                        NavigationLink(value: SelectionType.arrival) {
                            FromToTextView(type: $to)
                        }
                        Spacer()
                    }
                    .frame(height: 96)
                    .background(Rectangle()
                        .fill(.ypWhiteUniversal)
                        .cornerRadius(20))
                    Button {
                        isClicked.toggle()
                        swap(&from, &to)
                    } label: {
                        Image("ReverseButton")
                    }
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(Color.ypWhiteUniversal))
                }
                .padding()
            }
            .frame(height: 128)
            .cornerRadius(20)
            .padding([.leading, .trailing], 16)
            
            NavigationLink(value: SelectionType.find) {
                Text("Поиск")
                    .foregroundColor(.ypWhiteUniversal)
                    .font(.system(size: 17, weight: .bold))
                    .frame(width: 150, height: 60)
                    .background(.ypBlue)
                    .cornerRadius(16)
                    .padding(.vertical, 16)
                    .opacity(from == "Откуда" || to == "Куда" || from == "Куда" || to == "Откуда" ? 0 : 1)
            }
            Spacer()
            Rectangle().frame(height: 1)
                .foregroundStyle(.ypGray)
                .padding(.bottom, 10)
        }
        .background(.ypWhite)
        .navigationDestination(for: SelectionType.self) { type in
            switch type {
            case .departure: SearchCityView(path: $path, from: $from, to: $to, selectionType: .departure)
            case .arrival: SearchCityView(path: $path, from: $from, to: $to, selectionType: .arrival)
            case .find: RoutesListView(title: "\(from) → \(to)")
            }
        }
    }
}

#Preview {
    ScheduleView(path: .constant(NavigationPath()))
}
