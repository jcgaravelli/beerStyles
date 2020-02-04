//
//  Beer.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Beer: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case number
        case subcategories
    }
    
    let name: String
    let number: Int
    let subcategories: [Subcategory]
}
