//
//  FlightDetailViewModel.swift
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation
import Combine

class FlightDetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var details: FlightDetail?
    
    func getFlightDetails(id: Int) {
        NetworkManager.instance.getData(endpoint: .details, id: id,Type: FlightDetail.self)
            .sink { _ in
            } receiveValue: { [weak self] flightDetails in
                self?.details = flightDetails.first
            }
            .store(in: &cancellables)
    }
}
