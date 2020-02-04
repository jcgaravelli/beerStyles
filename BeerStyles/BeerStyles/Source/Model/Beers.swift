//
//  Beers.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Beers {
    let beers: [Beer]?
    
    init(beers: [Beer]) {
        self.beers = beers
    }
}

extension Beers: Decodable {
    enum CodingKeys: String, CodingKey {
        case beers
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        beers = try? container.decode([Beer].self, forKey: .beers)
    }
}
