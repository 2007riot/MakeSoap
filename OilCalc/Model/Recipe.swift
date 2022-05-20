//
//  Recipe.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 16/05/22.
//

import Foundation
struct Recipe: Codable, Identifiable {
    var id = UUID()
    let title: String
    let oils: [Oil]?
    let bubblyValue: Double?
    let cleaningValue: Double?
    let conditionValue: Double?
    let hardnessValue: Double?
    let longevityValue: Double?
    let stabilityValue: Double?
    let unit: String
    let NaOHvalue: Double?
    let KOHValue: Double?
    let soapWeight: Double
    let waterValue: Double?
    let extraWater: Double?
    let sfValue: Double
    let extraSFValue: Double
    let esOils: [EssentialOil]?
    
    
    
    
}

