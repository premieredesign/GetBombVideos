//
//  GameModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

class GameModel:Decodable {
    let results: GameSearchResults
}

class GameSearchResults:Decodable {
    let api_detail_url: String
    let image: ImageOptions
    let name: String
    let videos: [Videos]
}

class Videos:Decodable {
    let api_detail_url: String
    let name: String
    let id: Double
}
