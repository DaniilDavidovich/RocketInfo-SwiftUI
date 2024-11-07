//
//  MetricViewDetail.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct MetricsView: View {
    
    var heightIsMeters: Bool
    var diameterInMeters: Bool
    var massInKg: Bool
    var payloadInKg: Bool
    
    var height: MeasurementValue
    var diameter: MeasurementValue
    var mass: Mass
    var payloadWeight: PayloadWeight
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                if heightIsMeters {
                    MetricViewDetail(label: "Высота, \(height.getUnitShotcut(in: .meters))", value: "\(height.meters ?? 0)")
                } else {
                    MetricViewDetail(label: "Высота, \(height.getUnitShotcut(in: .feet))", value: "\(height.feet ?? 0)")
                }
                
                if diameterInMeters {
                    MetricViewDetail(label: "Диаметр, \(diameter.getUnitShotcut(in: .meters))", value: "\(diameter.meters ?? 0)")
                } else {
                    MetricViewDetail(label: "Диаметр, \(diameter.getUnitShotcut(in: .feet))", value: "\( diameter.feet ?? 0)")
                }
                
                if massInKg {
                    MetricViewDetail(label: "Масса, \(mass.getUnitShotcut(in: .kg))", value: "\(mass.kg)")
                } else {
                    MetricViewDetail(label: "Масса, \(mass.getUnitShotcut(in: .kg))", value: "\(mass.lb)")
                }
                
                if payloadInKg {
                    MetricViewDetail(label: "Полезная нагрузка, \(payloadWeight.getUnitShotcut(in: .kg))", value: "\(payloadWeight.kg)")
                } else {
                    MetricViewDetail(label: "Полезная нагрузка,  \(payloadWeight.getUnitShotcut(in: .lb))", value: "\( payloadWeight.lb)")
                }
            }
            .padding(.horizontal)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct MetricViewDetail: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(16)
        .background(Color(UIColors.systemGray6DarkMode))
        .cornerRadius(25)
    }
}
