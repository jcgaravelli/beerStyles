//
//  VitalStatistics.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct VitalStatistics: Decodable {
    let vsOG: String?
    let vsFG: String?
    let abv: String?
    let ibu: String?
    let srm: String?
}

extension VitalStatistics {
    enum CodingKeys: String, CodingKey {
        case vsOG = "og"
        case vsFG = "fg"
        case abv
        case ibu
        case srm
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        vsOG = try? container.decode(String.self, forKey: .vsOG)
        vsFG = try? container.decode(String.self, forKey: .vsFG)
        abv = try? container.decode(String.self, forKey: .abv)
        ibu = try? container.decode(String.self, forKey: .ibu)
        srm = try? container.decode(String.self, forKey: .srm)
    }
}
