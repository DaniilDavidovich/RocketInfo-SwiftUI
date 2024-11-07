//
//  RocketView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 27.07.24.
//

import SwiftUI

struct RocketView: View {
    
    var rocket: RocketModel
    
    @State var heightIsMeters: Bool = true
    @State var diameterInMeters: Bool = true
    @State var massInKg: Bool = true
    @State var payloadInKg: Bool = true
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { _ in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        GeometryReader { innerGeometry in
                            let yOffset = innerGeometry.frame(in: .global).minY
                            
                            ImageDetailView(imageData: rocket.images?.first)
                                .scaleEffect(yOffset > 0 ? 1 + yOffset / 700 : 1) // Увеличиваем масштаб изображения
                                .offset(y: yOffset > 0 ? -yOffset : 0) // Смещаем изображение вверх
                                .frame(height: yOffset > 0 ? 100 + yOffset : 100) // Изменяем высоту изображения
                        }
                        
                        VStack(alignment: .leading, spacing: 25) {
                            HeaderView(name: rocket.name,
                                       height: rocket.height,
                                       diamter: rocket.diameter,
                                       heightIsMeters: $heightIsMeters,
                                       diameterInMeters: $diameterInMeters,
                                       massInKg: $massInKg,
                                       payloadInKg: $payloadInKg,
                                       mass: rocket.mass,
                                       payloadWeight: rocket.payloadWeights.first ?? PayloadWeight(id: "2", name: "Error", kg: 2, lb: 2))
                            
                            MetricsView(heightIsMeters: heightIsMeters,
                                        diameterInMeters: diameterInMeters,
                                        massInKg: massInKg,
                                        payloadInKg: payloadInKg,
                                        height: rocket.height,
                                        diameter: rocket.diameter,
                                        mass: rocket.mass,
                                        payloadWeight: rocket.payloadWeights.first ?? PayloadWeight(id: "", name: "", kg: 0, lb: 0))
                            
                            GeneralInfoView(firstStage: rocket.firstFlight,
                                            country: rocket.country,
                                            costOfLaunch: String(rocket.costPerLaunch))
                            
                            StageView(nameStage: "ПEРВАЯ СТУПЕНЬ",
                                      countEngines: String(rocket.firstStage.engines),
                                      countFuel: String(rocket.firstStage.fuelAmountTons),
                                      burnTimeSEC: String(rocket.firstStage.burnTimeSEC ?? 0))
                            
                            StageView(nameStage: "ВТОРАЯ СТУПЕНЬ",
                                      countEngines: String(rocket.secondStage.engines),
                                      countFuel: String(rocket.secondStage.fuelAmountTons),
                                      burnTimeSEC: String(rocket.secondStage.burnTimeSEC ?? 0))
                            
                            CheckStartsView()
                        }
                        .background(Color.black)
                        .clipShape(CustomTopRoundedShape(cornerRadius: 30))
                    }
                    .padding(.top, UIScreen.main.bounds.height / 3.5) // Отступ сверху, чтобы картинка не перекрывала контент
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

