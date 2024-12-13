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
                testNearestStationsService()
            }
            Button("Search test") {
                testSearchService()
            }
            Button("Schedule test") {
                testScheduleService()
            }
            Button("Thread test") {
                testThreadService()
            }
            Button("Copyright test") {
                testCopyrightService()
            }
            Button("Get stations list test") {
                testStationsListService()
            }
            Button("Get nearest settlement test") {
                testNearestSettlementService()
            }
            Button("Get carrier info test") {
                testCarrierService()
            }
        }
    }
    
    func testNearestStationsService() {
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
    
    func testSearchService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = SearchService(
            client: client,
            apikey: Constants.apiKey)
        
        Task {
            do {
                let search = try await service.searchSchedule(from: "c146", to: "c213", date: "2024-12-13")
                print(search)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testScheduleService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = ScheduleService(client: client, apiKey: Constants.apiKey)
        
        Task {
            do {
                let schedule = try await service.getSchedule(station: "s9623547", date: "2024-12-13")
                print(schedule)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testThreadService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = ThreadService(client: client, apiKey: Constants.apiKey)
        
        Task {
            do {
                let thread = try await service.getThreadList(uid: "N4-483_241213_c2543_12", date: "2024-12-13")
                print(thread)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testCopyrightService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = CopyrightService(client: client, apikey: Constants.apiKey)
        
        Task {
            do {
                let copyright = try await service.getCopyrightInfo()
                print(copyright)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testStationsListService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = StationsListService(client: client, apikey: Constants.apiKey)
        
        Task {
            do {
                let list = try await service.getAllStations()
                guard let countriesCount = list.countries?.count else { return }
                print("Countries: \(countriesCount)")
                
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testNearestSettlementService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = NearestSettlementService(client: client, apikey: Constants.apiKey)
        
        Task {
            do {
                let settlement = try await service.getNearestSettlement(lat: 55.473641, lng: 37.244520)
                print(settlement)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func testCarrierService() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let service = CarrierService(client: client, apikey: Constants.apiKey)
        
        Task {
            do {
                let carrier = try await service.getCarrierInfo(code: "680")
                print(carrier)
            } catch {
                print("Something went wrong: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}

