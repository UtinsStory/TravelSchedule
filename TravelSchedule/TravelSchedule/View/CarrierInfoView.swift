//
//  CarrierInfoView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct CarrierInfoView: View {
    var carrier: CarrierModel
    
    var body: some View {
        ZStack {
            Color.ypWhite.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                if let logoUrl = URL(string: carrier.logoName) {
                    AsyncImage(url: logoUrl) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 343, height: 104)
                                .background(
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color.white)
                                )
                                .cornerRadius(24)
                                .padding(.top, 16)
                        } else {
                            Rectangle()
                                .frame(width: 343, height: 104)
                                .background(
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color.white)
                                )
                                .cornerRadius(24)
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(carrier.name)
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        Text("E-mail")
                            .font(.system(size: 17, weight: .regular))
                            .accentColor(.ypWhite)
                        Text("\(carrier.email)")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.ypBlue)
                    }
                    .padding(.top, 16)
                    
                    VStack(alignment: .leading) {
                        Text("Телефон")
                            .font(.system(size: 17, weight: .regular))
                            .accentColor(.ypWhite)
                        Text("\(carrier.phone)")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundStyle(.ypBlue)
                    }
                    .padding(.top, 16)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
        .navigationTitle("Информация о перевозчике")
    }
}

