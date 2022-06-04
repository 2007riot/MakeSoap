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
    let soapMakingProcess: String?
    let soapType: String?
    let isColdProcess: Bool?
    let isHotProcess: Bool?
    let isSolidSoap: Bool?
    let isLiquidSoap: Bool?
    let isHybridSoap: Bool?
    let oils: [Oil]?
    let bubblyValue: Double?
    let cleaningValue: Double?
    let conditionValue: Double?
    let hardnessValue: Double?
    let longevityValue: Double?
    let stabilityValue: Double?
    let unit: String?
    let NaOHvalue: Double?
    let KOHValue: Double?
    let soapWeight: Double?
    let waterValue: Double?
    let waterPerc: Double?
    let extraWater: Double?
    let extraWaterPerc: Double?
    let sfValue: Double?
    let sfPerc: Double?
    let extraSFValue: Double?
    let extraSFPerc: Double?
    let esOils: [EssentialOil]?
    let date: Date
    
    static func example() -> Recipe {
        
        Recipe(title: "Galina",
               soapMakingProcess: "Cold process",
               soapType: "Hybrid soap",
               isColdProcess: true,
               isHotProcess: false,
               isSolidSoap: true,
               isLiquidSoap: false,
               isHybridSoap: false,
               oils: OilStore(isDefaultData: true).oils,
               bubblyValue: 50,
               cleaningValue: 50,
               conditionValue: 50,
               hardnessValue: 50,
               longevityValue: 50,
               stabilityValue: 50,
               unit: "g",
               NaOHvalue: 10,
               KOHValue: 10,
               soapWeight: 10,
               waterValue: 10,
               waterPerc: 33,
               extraWater: 10,
               extraWaterPerc: 5,
               sfValue: 10,
               sfPerc: 7,
               extraSFValue: 10,
               extraSFPerc: 2,
               esOils:EssentialOilStore().essentialOils,
               date: .now)
    }
    
    
}

