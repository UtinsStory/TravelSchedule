//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct ErrorView: View {
    var imageName: String
    var message: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 223, height: 223)
            
            Text(message)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.ypBlack)
        }
        .background(.ypWhite)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ErrorView(imageName: "no_internet", message: "Нет интернета")
            ErrorView(imageName: "server_error", message: "Ошибка Сервера")
        }
    }
}
