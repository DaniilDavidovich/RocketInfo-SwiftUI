//
//  EndpointManagerProtocol.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

protocol EndpointManagerProtocol {
    
    static var headers: [String: String] { get }
    
    static func setupMockEndpoint() -> Endpoint
}
