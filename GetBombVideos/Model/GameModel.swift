//
//  GameModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

struct GameModel:Decodable {
    let results: GameSearchResults
}

struct GameSearchResults:Decodable {
    let image: ImageOptions
    let name: String
    let videos: [Videos]
}

struct Videos:Decodable {
    let api_detail_url: String
    let site_detail_url: String
    let name: String
    let id: Int
}
