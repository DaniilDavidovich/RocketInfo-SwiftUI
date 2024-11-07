//
//  ImageDetailView.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 18.08.24.
//

import SwiftUI

struct ImageDetailView: View {
    var imageData: Data?
    
    var body: some View {
        // Изображение вверху
        if let firstImageData = imageData,
           let uiImage = UIImage(data: firstImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.top)
        } else {
            // Плейсхолдер, если нет изображения
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.top)
        }
    }
}
