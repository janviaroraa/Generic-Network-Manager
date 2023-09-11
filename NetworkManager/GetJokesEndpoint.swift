//
//  GetJokesEndpoint.swift
//  NetworkManager
//
//  Created by Janvi Arora on 11/09/23.
//

import Foundation

struct GetJokesEndpoint: EndPoint {
    
    var path: String {
        return "/random_joke"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}
