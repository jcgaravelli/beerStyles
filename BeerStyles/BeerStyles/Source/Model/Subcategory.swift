//
//  Subcategory.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Subcategory: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case letter
        case subcategories
        case tags
        case commercialExamples
    }
    
    let name: String
    let letter: String
    let subcategories: [Subcategory]
    let tags: [Tag]
    let commercialExamples: [CommercialExemple]
}
