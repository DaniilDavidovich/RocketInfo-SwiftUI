//
//  NetworkManagerProtocol.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

/// `NetworkManagerProtocol` defines the structure for creating and executing network requests.
protocol NetworkManagerProtocol {
    /// Executes a network request.
    ///
    /// - Parameters:
    ///   - endpoint: An object conforming to `EndpointProtocol` that contains information about the request.
    ///   - responseModel: The type of the model into which the server response is expected to be decoded.
    ///   - completion: A closure called upon completion of the request, containing the result of the request
    ///                 in the form of a `Result` object with decoded data or an error.
    func makeRequest<T: Codable>(with endpoint: EndpointProtocol,
                                 responseModel: T.Type,
                                 completion: @escaping (Result<T, NetworkError>) -> Void)
    
    func makeRequestToImage(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}
