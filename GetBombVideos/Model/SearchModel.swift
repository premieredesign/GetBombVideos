//
//  APIModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

struct SearchModel:Decodable {
    let results: [SearchResults]
}

struct SearchResults:Decodable {
    let api_detail_url: String
    let image: ImageOptions
    let name: String
}

struct ImageOptions:Decodable {
    let medium_url: String
}
