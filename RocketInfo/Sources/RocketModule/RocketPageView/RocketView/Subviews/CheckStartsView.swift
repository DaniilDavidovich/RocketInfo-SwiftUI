//
//  CheckStartsView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct CheckStartsView: View {
    var body: some View {
        NavigationLink(destination: LaunchesView()) {
            Text("Посмотреть запуски")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(Color(UIColors.systemGray6DarkMode))
                .cornerRadius(25)
                .padding()
        }
    }
}

struct LaunchesView: View {
    var body: some View {
        VStack {
            Text("Запуски")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .background(Color.black)
    }
}
