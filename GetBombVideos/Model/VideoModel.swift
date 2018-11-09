//
//  VideoModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

struct VideoModel:Decodable {
    let results: VideoSearchResults
}

struct VideoSearchResults:Decodable {
    let image: ImageOptions
    let embed_player: String
    let youtube_id: String
}
