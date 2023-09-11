//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Janvi Arora on 11/09/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = endpoint.url else {
            print("Error with URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        request.allHTTPHeaderFields = endpoint.headers
        
        if let body = endpoint.body {
            request.httpBody = body
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                print("Received data: \(jsonData)")
                completion(.success(jsonData))
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
