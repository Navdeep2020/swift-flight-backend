//
//  NetworkManager.swift
//  VaporClientSide
//
//  Created by Navdeep Singh on 08/09/24.
//

import Foundation
import Combine

enum Endpoint: String {
    case flights
    case details
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}

class NetworkManager {
    
    static var instance = NetworkManager()
    
    private init() {
        
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "http://127.0.0.1:8080"
    
    func getData<T: Decodable>(endpoint: Endpoint, id: Int? = nil, Type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in

            guard let self = self else {
                return promise(.failure(NetworkError.invalidURL))
            }

            // Ensure that endpoint and id (if any) are appended correctly
            let fullURLString = id == nil ? "\(self.baseURL)/\(endpoint)" : "\(self.baseURL)/\(endpoint)/\(id!)"
            
            
            print("URL is \(fullURLString)")
            
            guard let url = URL(string: fullURLString) else {
                   return promise(.failure(NetworkError.invalidURL))
               }

            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}
