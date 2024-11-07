//
//  EndpointManager.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

enum EndpointManager: EndpointManagerProtocol {
    
    static let headers = [
        "Content-Type": "application/json",
    ]
    
    static func setupMockEndpoint() -> Endpoint {
        
        let url = URL(string: "https://api.spacexdata.com/v4/rockets")!
        
        let endpoint = Endpoint(url: url, method: .get, headers: self.headers)
        return endpoint
    }
}
