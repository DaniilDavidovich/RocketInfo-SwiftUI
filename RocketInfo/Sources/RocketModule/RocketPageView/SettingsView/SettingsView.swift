//
//  SettingsView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var heightIsMeters: Bool
    @Binding var diameterInMeters: Bool
    @Binding var massInKg: Bool
    @Binding var payloadInKg: Bool
    
    var mass: Mass
    var heing: MeasurementValue
    var diameter:MeasurementValue
    var payloadWeight: PayloadWeight
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                UnitToggle(title: "Высота",
                           isMetric: $heightIsMeters,
                           metricLabel: heing.getUnitShotcut(in: .meters),
                           imperialLabel: heing.getUnitShotcut(in: .feet))
                
                UnitToggle(title: "Диаметр",
                           isMetric: $diameterInMeters,
                           metricLabel: diameter.getUnitShotcut(in: .meters),
                           imperialLabel: diameter.getUnitShotcut(in: .feet))
                
                UnitToggle(title: "Масса",
                           isMetric: $massInKg,
                           metricLabel: mass.getUnitShotcut(in: .kg),
                           imperialLabel: mass.getUnitShotcut(in: .lb))
                
                UnitToggle(title: payloadWeight.name, 
                           isMetric: $payloadInKg,
                           metricLabel: payloadWeight.getUnitShotcut(in: .kg),
                           imperialLabel: payloadWeight.getUnitShotcut(in: .lb))
            }
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Настройки")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Закрыть")
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
                .background(Color.black)
        }
        .preferredColorScheme(.dark)
        .background(Color.black)
    }
}
