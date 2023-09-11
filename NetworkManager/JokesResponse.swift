//
//  JokesResponse.swift
//  NetworkManager
//
//  Created by Janvi Arora on 11/09/23.
//

import Foundation

struct JokesResponse: Codable {
    let type, setup, punchline: String
    let id: Int
}

