//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Гена Утин on 05.12.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get nearest stations test") {
                stations()
            }
            
        }
    }
    
    func stations() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = NearestStationsService(
            client: client,
            apikey: Constants.apiKey
        )
        
        Task {
            do {
                let stations = try await service.getNearestStations(lat: 25.229762, lng: 55.289311, distance: 20)
                print(stations)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
