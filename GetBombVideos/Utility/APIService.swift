//
//  APIService.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchSearchResults<T: Decodable>(search: String, completion: @escaping (T) -> ()) {
        let APIKEY = "853e50372499e9615ebbb7029761b648292346b9"
        guard let url = URL(string: "https://www.giantbomb.com/api/search/?api_key=\(APIKEY)&format=json&query=\(search)resources=game") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print("Failed to retrieve data", err.localizedDescription)
                return
            }
            
            guard let data = data else {return}
            
            do {
                let responseDataObj = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(responseDataObj)
                }
            } catch let decodeErr {
                print("Failed to Decode", decodeErr.localizedDescription)
            }
        }.resume()
    }
}
