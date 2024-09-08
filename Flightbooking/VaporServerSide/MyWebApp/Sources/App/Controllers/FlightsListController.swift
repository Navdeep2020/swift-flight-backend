//
//  File.swift
//  
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation
import Vapor

class FlightsListController {
    
    // Handles the request and returns a JSON response
    func handleFlightsListRequest(req: Request) async throws -> Response {
        do {
            let flightsList = getFlightsList()
            let jsonData = try JSONSerialization.data(withJSONObject: flightsList, options: .prettyPrinted)
            
            let response = Response(status: .ok)
            response.headers.contentType = .json
            response.body = .init(data: jsonData)
            
            return response
        } catch {
            let response = Response(status: .internalServerError)
            response.body = .init(string: "Something went wrong")
            return response
        }
    }
}

public func getFlightsList() -> [[String: Any]] {
    return [
        ["id":1001,
         "flightNumber": "AI323",
         "company": "Air India",
         "fare": 27637,
         "stops": 0,
         "departure":"06:30",
         "arrival": "11:30",
         "duration": "9h 30m",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai"],
        ["id":1002,
         "flightNumber": "VI116",
         "company": "Vistara",
         "fare": 28613,
         "stops": 1,
         "departure":"20:55",
         "arrival": "08:15",
         "duration": "33h",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai"],
        ["id":1003,
         "flightNumber": "LF342",
         "company": "Lufthansa",
         "fare": 36282,
         "stops": 0,
         "departure":"02:50",
         "arrival": "14:40",
         "duration": "16h 20m",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai"],
        ["id":1004,
         "flightNumber": "EH773",
         "company": "Etihad Airways",
         "fare": 141628,
         "stops": 2,
         "departure":"02:50",
         "arrival": "16:25",
         "duration": "18h 05m",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai"],
        ["id":1005,
         "flightNumber": "BR343",
         "company": "British Airways",
         "fare": 148936,
         "stops": 1,
         "departure":"20:55",
         "arrival": "15:20",
         "duration": "51h",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai"]]
}
