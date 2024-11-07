//
//  Endpoint.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

final class Endpoint: EndpointProtocol {

    var url: URL
    var method: RequestType
    var headers: [String: String]
    var body: [String: Any]?

    init(url: URL,
         method: RequestType,
         headers: [String: String],
         body: [String: Any]? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}
