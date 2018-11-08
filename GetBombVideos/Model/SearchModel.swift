//
//  APIModel.swift
//  GetBombVideos
//
//  Created by Clinton Johnson on 11/7/18.
//  Copyright © 2018 Clinton Johnson. All rights reserved.
//

import Foundation

class SearchModel:Decodable {
    let results: [SearchResults]
}

class SearchResults:Decodable {
    let api_detail_url: String
    let image: ImageOptions
    let name: String
}

class ImageOptions:Decodable {
    let medium_url: String
}
