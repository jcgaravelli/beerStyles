//
//  Guidelines.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Guidelines: Decodable {
    enum CodingKeys: String, CodingKey {
        case overallImpression
        case aroma
        case appearance
        case flavor
        case mouthfeel
        case comments
        case history
        case ingredients
        case comparison
        case vitalStatistics
    }
    
    let overallImpression: String
    let aroma: String
    let appearance: String
    let flavor: String
    let mouthfeel: String
    let comments: String
    let history: String
    let ingredients: String
    let comparison: String
    let vitalStatistics: VitalStatistics
}
