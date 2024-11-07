//
//  GeneralInfoView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct GeneralInfoView: View {
    var firstStage: String
    var country: String
    var costOfLaunch: String
    
    var body: some View {
        VStack(spacing: 12) {
            DetailView(label: "Первый запуск", value: firstStage)
            DetailView(label: "Страна", value: country)
            DetailView(label: "Стоимость запуска", value: costOfLaunch)
        }
        .padding(.horizontal)
    }
}
