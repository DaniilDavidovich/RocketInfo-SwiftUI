//
//  RocketViewModel.swift
//  RocketInfo
//
//  Created by Daniil Davidovich on 27.07.24.
//

import Foundation
import Combine

class RocketViewModel: ObservableObject {
    
    @Published private var model: [RocketModel]?
    private var images: [Data] = []

    func getData() {
        let endpoint: EndpointProtocol = EndpointManager.setupMockEndpoint()
        let networkManager: NetworkManagerProtocol = NetworkManager()

        networkManager.makeRequest(with: endpoint, responseModel: [RocketModel].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.model = model

                    let group = DispatchGroup()

                    for (index, rocket) in model.enumerated() {
                        var updatedRocket = rocket
                        var rocketImages: [Data] = []

                        rocket.flickrImages.forEach { imageUrl in
                            guard let url = URL(string: imageUrl) else { return }

                            group.enter()
                            networkManager.makeRequestToImage(with: url) { result in
                                defer { group.leave() }

                                switch result {
                                case .success(let imageData):
                                    rocketImages.append(imageData)
                                case .failure(let error):
                                    print("Error downloading image: \(error)")
                                }
                            }
                        }

                        group.notify(queue: .main) {
                            updatedRocket.images = rocketImages
                            self?.model?[index] = updatedRocket

                            if index == model.count - 1 {
                                print("All rockets have been processed.")
                            }
                        }
                    }

                case .failure(let error):
                    print("Failed to fetch rocket data: \(error)")
                }
            }
        }
    }
    
    func getModel() -> [RocketModel]? {
        return model
    }
    
    init() {
        getData()
    }
}
