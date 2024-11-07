//
//  LoggerCattegory.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation
import OSLog

/// An enumeration representing different categories for logging purposes.
enum LoggerCattegory: String {
    case http
    case keychain
}

extension Logger {

    /// The main logging subsystem, using the bundle identifier of the main bundle.
    private static let subsystem = Bundle.main.bundleIdentifier ?? ""

    /// Logger instance for HTTP-related logging.
    static let http = Logger(subsystem: subsystem, category: LoggerCattegory.http.rawValue)
    static let keychain = Logger(subsystem: subsystem, category: LoggerCattegory.keychain.rawValue)
}
