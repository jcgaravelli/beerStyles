//
//  Tags.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Tag: Decodable {
    enum CodingKeys: String, CodingKey {
        case tag
    }
    
    let tag: String
}
