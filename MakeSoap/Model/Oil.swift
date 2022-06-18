//
//  Oil.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import Foundation
import SwiftUI

class Oil: Identifiable, Codable, Hashable, ObservableObject {
    
    internal init(id: Int, name: String, saponificationKOH: Double, saponificationNaOH: Double, bubbly: Double, cleaning: Double, condition: Double, hardness: Double, longevity: Double, userWeightValue: Double? = nil, userPercent: Double? = nil, stability: Double, Lauric: Double, Linoleic: Double, Linolenic: Double, Myristic: Double, Oleic: Double, Palmitic: Double, Ricinoleic: Double, Stearic: Double) {
        self.id = id
        self.name = name
        self.saponificationKOH = saponificationKOH
        self.saponificationNaOH = saponificationNaOH
        self.bubbly = bubbly
        self.cleaning = cleaning
        self.condition = condition
        self.hardness = hardness
        self.longevity = longevity
        self.userWeightValue = userWeightValue
        self.userPercent = userPercent
        self.stability = stability
        self.Lauric = Lauric
        self.Linoleic = Linoleic
        self.Linolenic = Linolenic
        self.Myristic = Myristic
        self.Oleic = Oleic
        self.Palmitic = Palmitic
        self.Ricinoleic = Ricinoleic
        self.Stearic = Stearic
    }
    
    
    
    var id: Int
    var name: String
    var saponificationKOH: Double
    var saponificationNaOH: Double
    var bubbly: Double
    var cleaning: Double
    var condition: Double
    var hardness: Double
    var longevity: Double
    var userWeightValue: Double?
    var userPercent: Double?
    var stability: Double
    var Lauric: Double
    var Linoleic: Double
    var Linolenic: Double
    var Myristic: Double
    var Oleic: Double
    var Palmitic: Double
    var Ricinoleic: Double
    var Stearic: Double
   
    var isInRecipe: Bool {
        if OilStore(isDefaultData: false).chosenOils.contains(where: {$0.name == name}) {
            return true
        } else {
            return false
        }
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userWeightValue)
    }

    static func == (lhs: Oil, rhs: Oil) -> Bool {
         lhs.userWeightValue == rhs.userWeightValue
    }
    
    static func example() -> Oil {
        
        Oil(id: 23,
            name: "Canola Oil, high oleic",
            saponificationKOH: 0.186,
            saponificationNaOH: 0.133,
            bubbly: 0,
            cleaning: 0,
            condition: 90,
            hardness: 6,
            longevity: 6,
            stability: 6,
            Lauric: 0,
            Linoleic: 12,
            Linolenic: 4,
            Myristic: 0,
            Oleic: 74,
            Palmitic: 4,
            Ricinoleic: 0,
            Stearic: 2)
        
    }
}
