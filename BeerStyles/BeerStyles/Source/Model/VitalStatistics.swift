//
//  VitalStatistics.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct VitalStatistics: Decodable {
    enum CodingKeys: String, CodingKey {
        case vsOG = "og"
        case vsFG = "fg"
        case abv
        case ibu
        case srm
    }
    
    let vsOG: String
    let vsFG: String
    let abv: String
    let ibu: String
    let srm: String
}
