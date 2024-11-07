//
//  NetworkError.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//

enum NetworkError: String, Error {

    case invalidURL
    case invalidData
    case invalidParsedData
    case invalidRequest
    case invalidStatusCode
    case clientError
    case serverError

    var value: String {
        switch self {
        case .clientError:
            return "clientError"
        case  .invalidData:
            return "invalidData"
        case .invalidParsedData:
            return "invalidParsedData"
        case .invalidRequest:
            return "invalidRequest"
        case .invalidStatusCode:
            return "invalidStatusCode"
        case .invalidURL:
            return "invalidURL"
        case .serverError:
            return "serverError"
        }
    }
}
