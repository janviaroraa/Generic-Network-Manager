//
//  EndPoint.swift
//  NetworkManager
//
//  Created by Janvi Arora on 11/09/23.
//

import Foundation

struct Constants {
    static let baseURL = "https://official-joke-api.appspot.com"
}


protocol EndPoint {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String:String]? { get }
    var body: Data? { get }
    var url: URL? { get }
}

extension EndPoint {
    var url: URL? {
        return URL(string: "\(Constants.baseURL)\(path)")
    }
    
    var defaultHeaders: [String: String] {
        var headers: [String: String] = [:]
        if let token = UserDefaults.standard.string(forKey: "authenticationAPI") {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
}
