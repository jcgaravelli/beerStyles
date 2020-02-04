//
//  Beers.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Beers: Decodable {
    enum CodingKeys: String, CodingKey {
        case beers
    }
    
    let beers: [Beer]
}
