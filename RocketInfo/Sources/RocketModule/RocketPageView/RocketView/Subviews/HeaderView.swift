//
//  HeaderView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct HeaderView: View {
    var name: String
    var height: MeasurementValue
    var diamter: MeasurementValue
    
    @Binding var heightIsMeters: Bool
    @Binding var diameterInMeters: Bool
    @Binding var massInKg: Bool
    @Binding var payloadInKg: Bool
    
    var mass: Mass
    var payloadWeight: PayloadWeight
    @State private var showingSettings = false
    
    var body: some View {
        HStack {
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                showingSettings.toggle()
            }) {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(heightIsMeters: $heightIsMeters,
                             diameterInMeters: $diameterInMeters,
                             massInKg: $massInKg,
                             payloadInKg: $payloadInKg,
                             mass: mass,
                             heing: height,
                             diameter: diamter,
                             payloadWeight: payloadWeight)
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
}
