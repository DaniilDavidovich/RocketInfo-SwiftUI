//
//  DetailView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct DetailView: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .foregroundColor(.white)
        }
    }
}
