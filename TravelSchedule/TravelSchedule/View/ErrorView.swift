//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 16.01.2025.
//

import SwiftUI

struct ErrorView: View {
    @State var errorType: ErrorType
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            switch errorType {
            case .noInternet:
                Image(.noInternet)
                    .resizable()
                    .frame(width: 223, height: 223)
                    .scaledToFit()
                Text(errorType.rawValue)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.ypBlack)
            case .serverError:
                Image(.serverError)
                    .resizable()
                    .frame(width: 223, height: 223)
                    .scaledToFit()
                Text(errorType.rawValue)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.ypBlack)
            }
        }
    }
}

#Preview {
    ErrorView(errorType: .noInternet)
}
