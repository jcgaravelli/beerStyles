//
//  CommercialExample.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct CommercialExample {
    let name: String?
    
    init(name: String?) {
        self.name = name
    }
}

extension CommercialExample: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? container.decode(String.self, forKey: .name)
    }
}
