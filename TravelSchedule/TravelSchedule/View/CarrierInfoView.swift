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
            Color.ypWhite.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Image(carrier.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 343, height: 104)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white)
                    )
                    .cornerRadius(24)
                    .padding(.top, 16)
                
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

struct CarrierDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let carrier = CarrierModel(name: "ОАО РЖД", logo: "RZD", email: "example@example.com", phone: "+1234567890")
        return CarrierInfoView(carrier: carrier)
    }
}
