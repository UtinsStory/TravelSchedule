//
//  TripFilterView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct TripFilterView: View {
    @ObservedObject var viewModel: TripsViewModel
    
    @State private var selectedTimes: Set<TimeIntervalEnum> = []
    @State private var showTransfers: Bool?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Время Отправления")
                    .font(.system(size: 21, weight: .bold))
                    .padding(.horizontal)
                    .padding(.top)
                
                ForEach(TimeIntervalEnum.allCases, id: \.self) { interval in
                    HStack {
                        Text(interval.rawValue)
                        Spacer()
                        CheckBoxView(isChecked: selectedTimes.contains(interval)) {
                            if selectedTimes.contains(interval) {
                                selectedTimes.remove(interval)
                            } else {
                                selectedTimes.insert(interval)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 21, weight: .bold))
                    .padding(.horizontal)
                    .padding(.top)
                
                HStack {
                    Text("Да")
                    Spacer()
                    RadioButtonView(isSelected: showTransfers == true) {
                        showTransfers = true
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                HStack {
                    Text("Нет")
                    Spacer()
                    RadioButtonView(isSelected: showTransfers == false) {
                        showTransfers = false
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            
            Spacer()
            
            if !selectedTimes.isEmpty && showTransfers != nil {
                Button(action: {
                    viewModel.applyFilters(selectedTimes: selectedTimes, showTransfers: showTransfers)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Применить")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 343, height: 60)
                        .background(Color.ypBlue)
                        .cornerRadius(16)
                }
                .padding()
            }
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct CheckBoxView: View {
    var isChecked: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(.ypBlack)
                .font(.system(size: 24))
        }
    }
}

struct RadioButtonView: View {
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isSelected ? "circle.inset.filled" : "circle")
                .foregroundColor(.ypBlack)
                .font(.system(size: 24))
        }
    }
}

