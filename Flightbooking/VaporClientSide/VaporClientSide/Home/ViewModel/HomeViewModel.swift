//
//  HomeViewModel.swift
//  VaporClientSide
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var flight = [Flight]()
    
    func getHomeData() {
        NetworkManager.instance.getData(endpoint: .flights, Type: Flight.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] flightsData in
                self?.flight = flightsData
            }
            .store(in: &cancellable)

    }
}
