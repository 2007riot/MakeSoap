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
    let date: Date
    
    static func example() -> Recipe {
        Recipe(title: "Galina", oils: OilStore(defaultData: true).oils, bubblyValue: 50, cleaningValue: 50, conditionValue: 50, hardnessValue: 50, longevityValue: 50, stabilityValue: 50, unit: "gr", NaOHvalue: 10, KOHValue: 10, soapWeight: 10, waterValue: 10, extraWater: 10, sfValue: 10, extraSFValue: 10, esOils: EssentialOilStore().essentialOils, date: Date.now)
    }
    
    
}

