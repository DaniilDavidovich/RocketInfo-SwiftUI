//
//  RocketPageView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI


struct RocketPageView: View {
    @ObservedObject var viewModel = RocketViewModel()

    var body: some View {
        NavigationView {
            TabView {
                if let models = viewModel.getModel(), !models.isEmpty {
                    ForEach(models, id: \.self) { rocket in
                        RocketView(rocket: rocket)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .ignoresSafeArea()
            .background(Color.black)
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    RocketPageView()
}
