//
//  Movie.swift
//  MovieList
//
//  Created by Rossiny Amaral on 03/04/19.
//  Copyright © 2019 Rossiny. All rights reserved.
//

import Foundation


struct Movie : Codable {
    let title:String?
    let overview: String?
    let duration: String?
    let release_year: String?
    let cover_url: String?
    //let backdrops_url: String?
    let id: String?
}
