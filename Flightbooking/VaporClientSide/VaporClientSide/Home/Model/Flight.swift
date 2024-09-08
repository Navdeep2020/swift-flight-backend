//
//  Flight.swift
//  VaporClientSide
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation

struct Flight: Decodable, Identifiable, Hashable {
    var id: Int
    var fare: Int
    var stops: Int
    var flightNumber: String?
    var company: String?
    var departure: String?
    var arrival: String?
    var duration: String?
    var source: String?
    var destination: String?
    var sourceCode: String?
    var destinationCode: String?
}
