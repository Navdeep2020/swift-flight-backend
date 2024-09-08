//
//  File.swift
//  
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation
import Vapor

class FlightsDetailController {
    
    func handleFlightDetailRequest(req: Request) async throws -> Response {
        do {
            // Extract flight ID from request's parameters
            guard let flightId = req.parameters.get("id", as: Int.self) else {
                let response = Response(status: .badRequest)
                response.body = .init(string: "Flight ID is missing")
                return response
            }
            
            // Filter the flight details by the flight ID
            let flightDetails = getFlightsDetailData().filter { details in
                if let id = details["id"] as? Int {
                    return id == flightId
                }
                return false
            }
            
            if flightDetails.isEmpty {
                  let response = Response(status: .notFound)
                  response.body = .init(string: "Flight not found")
                  return response
              }
            
            // Serialize the flight details into JSON
            let jsonData = try JSONSerialization.data(withJSONObject: flightDetails, options: .prettyPrinted)
            
            // Create a response and return the flight details as JSON
            let response = Response(status: .ok)
            response.headers.contentType = .json
            response.body = .init(data: jsonData)

            return response
            
        } catch  {
            let response = Response(status: .internalServerError)
            response.body = .init(string: "Something went wrong")
            return response
        }
    }
}

func getFlightsDetailData() -> [[String: Any]] {
    return [
        ["id":1001,
         "flightNumber": "AI323",
         "company": "Air India",
         "fare": 32887,
         "stops": 0,
         "departure":"06:30",
         "arrival": "11:30",
         "duration": "9h 30m",
         "sourceCode":"DEL",
         "destinationCode": "DXB",
         "source":"Delhi",
         "destination":"Dubai",
         "sourceAirport": "Indira Gandhi International Airport",
         "destinationAirport": "Dubai International Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
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
         "destination":"Dubai",
         "sourceAirport": "Indira Gandhi International Airport",
         "destinationAirport": "Dubai International Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
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
         "destination":"Dubai",
         "sourceAirport": "Indira Gandhi International Airport",
         "destinationAirport": "Dubai International Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
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
         "destination":"Dubai",
         "sourceAirport": "Indira Gandhi International Airport",
         "destinationAirport": "Dubai International Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"],
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
         "destination":"Dubai",
         "sourceAirport": "Indira Gandhi International Airport",
         "destinationAirport": "Dubai International Airport",
         "baggage": "ADULT",
         "checkin": "46 Kgs (2 Pc x 23 Kgs)",
         "cabin": "7 Kgs",
         "fareType": "Flex",
         "cancellation":"Cancellation Available"]]
}
