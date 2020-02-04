//
//  Guidelines.swift
//  BeerStyles
//
//  Created by Paulo Cesar Morandi Massuci on 04/02/20.
//

import Foundation

struct Guidelines {
    let overallImpression: String?
    let aroma: String?
    let appearance: String?
    let flavor: String?
    let mouthfeel: String?
    let comments: String?
    let history: String?
    let ingredients: String?
    let comparison: String?
    let vitalStatistics: VitalStatistics?
}

extension Guidelines: Decodable {
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        overallImpression = try? container.decode(String.self, forKey: .overallImpression)
        aroma = try? container.decode(String.self, forKey: .aroma)
        appearance = try? container.decode(String.self, forKey: .appearance)
        flavor = try? container.decode(String.self, forKey: .flavor)
        mouthfeel = try? container.decode(String.self, forKey: .mouthfeel)
        comments = try? container.decode(String.self, forKey: .comments)
        history = try? container.decode(String.self, forKey: .history)
        ingredients = try? container.decode(String.self, forKey: .ingredients)
        comparison = try? container.decode(String.self, forKey: .comparison)
        vitalStatistics = try? container.decode(VitalStatistics.self, forKey: .vitalStatistics)
    }
}
