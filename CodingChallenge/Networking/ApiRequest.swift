//
//  ApiRequest.swift
//  CodingChallenge
//
//  Created by Gustavo Colaco on 11/09/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation

struct ApiRequest {
    let resourceURL: URL
    
    init(feedUrl: String) {
        let urlString = "https://rss.itunes.apple.com/api/v1/\(feedUrl)"
        guard let resourceURL = URL(string: urlString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getApiDatas(completion: @escaping(Result<[ApiDetails], Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let apiResponse = try decoder.decode(ApiFeed.self, from: jsonData)
                let apiDetails = apiResponse.feed.results
                completion(.success(apiDetails))
            }catch {
                print(error.localizedDescription)
            }
            
        }
        dataTask.resume()
    }
    
}
