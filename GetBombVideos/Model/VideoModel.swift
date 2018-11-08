//
//  VideoModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

class VideoModel:Decodable {
    let results: VideoSearchResults
}

class VideoSearchResults:Decodable {
    let embed_player: String
}
