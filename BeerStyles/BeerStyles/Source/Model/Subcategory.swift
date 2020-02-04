//
//  Subcategory.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Subcategory {
    let name: String?
    let letter: String?
    let guidelines: Guidelines?
    let tags: [Tag]?
    let commercialExamples: [CommercialExample]?
}

extension Subcategory: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case letter
        case guidelines
        case tags
        case commercialExamples
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? container.decode(String.self, forKey: .name)
        letter = try? container.decode(String.self, forKey: .letter)
        guidelines = try? container.decode(Guidelines.self, forKey: .letter)
        tags = try? container.decode([Tag].self, forKey: .letter)
        commercialExamples = try? container.decode([CommercialExample].self, forKey: .letter)
    }
}
