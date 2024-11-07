//
//  EndpointProtocol.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

/// A protocol defining the structure for network request endpoints.
protocol EndpointProtocol {

    /// The URL of the endpoint.
    var url: URL { get set }

    /// The HTTP request method for the endpoint.
    var method: RequestType { get set }

    /// The headers to be included in the request.
    var headers: [String: String] { get set }

    /// The body parameters to be sent with the request.
    var body: [String: Any]? { get set }
}
