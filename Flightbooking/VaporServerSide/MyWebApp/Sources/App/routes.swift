import Vapor

func routes(_ app: Application) throws {
//    // http://127.0.0.1:8080/getUsersList
//    app.get("getUsersList") { req async -> [User] in
//        return [User()]
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
    
   // http://127.0.0.1:8080/flights
    // Define route for fetching the flights list
    app.get("flights") { req async throws -> Response in
        let flightsListController = FlightsListController()
        return try await flightsListController.handleFlightsListRequest(req: req)
    }
    
    // Define route for fetching flight details by ID
    app.get("details", ":id") { req async throws -> Response in
        let flightsDetailController = FlightsDetailController()
        return try await flightsDetailController.handleFlightDetailRequest(req: req)
    }
}
