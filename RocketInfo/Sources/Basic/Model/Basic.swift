//
//  File.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation

// MARK: - RocketModel

struct RocketModel: Codable, Hashable {
    var uUID = UUID()  // This will not be decoded, but generated locally
    var height: MeasurementValue
    var diameter: MeasurementValue
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    let payloadWeights: [PayloadWeight]
    let flickrImages: [String]
    var images: [Data]?
    let name, type: String
    let active: Bool
    let stages, boosters, costPerLaunch, successRatePct: Int
    let firstFlight, country, company: String
    let wikipedia: String
    let description, id: String

    enum CodingKeys: String, CodingKey {
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia, description, id
    }
}

// MARK: - MeasurementValue
struct MeasurementValue: Codable, Hashable {
    let meters: Double?
    let feet: Double?
    
    func getValut(in unit: MeasurementUnitLenght) -> Double? {
        switch unit {
        case .meters:
            return meters
        case .feet:
            return feet
        }
    }
    
    func getUnitShotcut(in unit: MeasurementUnitLenght) -> String {
        switch unit {
        case .meters:
            return "m"
        case .feet:
            return "ft"
        }
    }
}

enum MeasurementUnitLenght {
    case meters
    case feet
}

enum MeasurementUnitMass {
    case kg
    case lb
}

// MARK: - Mass
struct Mass: Codable, Hashable {
    let kg, lb: Int
    
    func getUnitShotcut(in unit: MeasurementUnitMass) -> String {
        switch unit {
        case .kg:
            return "kg"
        case .lb:
            return "lb"
        }
    }
}

// MARK: - FirstStage
struct FirstStage: Codable, Hashable {
    let thrustSeaLevel, thrustVacuum: Thrust
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Thrust
struct Thrust: Codable, Hashable {
    let kN, lbf: Int
}

// MARK: - Engines
struct Engines: Codable, Hashable {
    let isp: ISP
    let thrustSeaLevel, thrustVacuum: Thrust
    let number: Int
    let type, version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1, propellant2: String
    let thrustToWeight: Double

    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

// MARK: - ISP
struct ISP: Codable, Hashable {
    let seaLevel, vacuum: Int

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

// MARK: - LandingLegs
struct LandingLegs: Codable, Hashable {
    let number: Int
    let material: String?
}

// MARK: - PayloadWeight
struct PayloadWeight: Codable, Hashable {
    let id, name: String
    let kg, lb: Int
    
    func getUnitShotcut(in unit: MeasurementUnitMass) -> String {
        switch unit {
        case .kg:
            return "kg"
        case .lb:
            return "lb"
        }
    }
}

// MARK: - SecondStage
struct SecondStage: Codable, Hashable {
    let thrust: Thrust
    let payloads: Payloads
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrust
        case payloads
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

// MARK: - Payloads
struct Payloads: Codable, Hashable {
    let compositeFairing: CompositeFairing?
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

// MARK: - CompositeFairing
struct CompositeFairing: Codable, Hashable {
    let height: MeasurementValue
    let diameter: MeasurementValue
}
