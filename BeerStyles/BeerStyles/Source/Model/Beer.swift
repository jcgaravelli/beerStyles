//
//  Beer.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Beer {
    let name: String?
    let number: Int?
    let subcategories: [Subcategory]?
}

extension Beer: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case number
        case subcategories
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? container.decode(String.self, forKey: .name)
        number = try? container.decode(Int.self, forKey: .number)
        subcategories = try? container.decode([Subcategory].self, forKey: .subcategories)
    }
}
