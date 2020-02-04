//
//  CommercialExemple.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct CommercialExemple: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    let name: String
}
