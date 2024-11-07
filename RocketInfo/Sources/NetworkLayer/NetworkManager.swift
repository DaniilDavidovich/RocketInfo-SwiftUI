//
//  NetworkManager.swift
//  SpaceX Rockets
//
//  Created by Daniil Davidovich on 27.07.24.
//


import OSLog

final class NetworkManager: NetworkManagerProtocol {
    private let session = URLSession(configuration: .default)

    func makeRequest<T: Codable>(with endpoint: EndpointProtocol,
                                 responseModel: T.Type,
                                 completion: @escaping (Result<T, NetworkError>) -> Void) {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers

        if let body = endpoint.body {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body)
                request.httpBody = jsonData
            } catch {
                completion(.failure(.invalidData))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.invalidData.value)]
                -----------------------
                """)
                return
            }
        }

        session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidRequest))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.invalidRequest.value)]
                -----------------------
                """)
                return
            }

            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data else { return }
                completion(.failure(.clientError))
                do {
                    dump(data)
                    let decodedData = try JSONDecoder().decode(responseModel, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.invalidParsedData))
                    Logger.http.error("""
                    -----------------------
                    [\(request.httpMethod ?? "No Method")]
                    [\(NetworkError.invalidParsedData.value)]
                    -----------------------
                    """)
                }
            case 400...499:
                completion(.failure(.clientError))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.clientError.value)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            case 500...599:
                completion(.failure(.serverError))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.serverError.value)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            default:
                completion(.failure(.invalidStatusCode))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.invalidStatusCode.value)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            }
        }.resume()
    }
    
    func makeRequestToImage(with url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        var request = URLRequest(url: url)

        // Начало задачи для загрузки данных изображения
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidRequest))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.invalidRequest)]
                -----------------------
                """)
                return
            }

            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data else {
                    completion(.failure(.invalidData))
                    Logger.http.error("""
                    -----------------------
                    [\(NetworkError.invalidData)]
                    -----------------------
                    """)
                    return
                }
                
                // Возвращаем полученные данные изображения
                completion(.success(data))
                
            case 400...499:
                completion(.failure(.clientError))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.clientError)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            case 500...599:
                completion(.failure(.serverError))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.serverError)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            default:
                completion(.failure(.invalidStatusCode))
                Logger.http.error("""
                -----------------------
                [\(NetworkError.invalidStatusCode)]
                [\(httpResponse.statusCode)]
                [\(request.httpMethod ?? "No Method")]
                -----------------------
                """)
            }
        }.resume()
    }
    
}
