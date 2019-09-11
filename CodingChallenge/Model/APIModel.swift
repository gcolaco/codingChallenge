//
//  APIModel.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation

struct ApiFeed: Decodable {
    var feed: ApiResults
}

struct ApiResults: Decodable {
    var results: [ApiDetails]
}

struct ApiDetails: Decodable{
    let artistName: String
    let releaseDate: String
    let name: String
    let artworkUrl100: String
}

