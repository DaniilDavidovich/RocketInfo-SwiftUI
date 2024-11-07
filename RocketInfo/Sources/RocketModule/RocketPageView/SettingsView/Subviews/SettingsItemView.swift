//
//  SettingsItemView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 19.08.24.
//

import SwiftUI

struct UnitToggle: View {
    
    var title: String
    @Binding var isMetric: Bool
    var metricLabel: String
    var imperialLabel: String
    
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 150, alignment: .leading)
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(spacing: 0) {
                Button(action: {
                    isMetric = true
                }) {
                    Text(metricLabel)
                        .foregroundColor(isMetric ? .black : .white)
                        .frame(width: 60, height: 35)
                        .background(isMetric ? Color.white : Color.clear)
                        .fontWeight(.medium)
                        .cornerRadius(9)
                }

                Button(action: {
                    isMetric = false
                }) {
                    Text(imperialLabel)
                        .foregroundColor(!isMetric ? .black : .white)
                        .frame(width: 60, height: 30)
                        .background(!isMetric ? Color.white : Color.clear)
                        .fontWeight(.medium)
                        .cornerRadius(9)
                }
            }
        }
    }
}
