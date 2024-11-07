//
//  FirstStageView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct StageView: View {
    var nameStage: String
    var countEngines: String
    var countFuel: String
    var burnTimeSEC: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(nameStage)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.top, 12)
            DetailView(label: "Количество двигателей", value: countEngines)
            DetailView(label: "Количество топлива", value: countFuel)
            DetailView(label: "Время сгорания", value: burnTimeSEC)
        }
        .background(Color.black)
        .padding(.horizontal)
    }
}
