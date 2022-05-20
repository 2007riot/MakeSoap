//
//  Oil.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import Foundation
import SwiftUI

class Oil: Identifiable, Codable, Hashable, ObservableObject {
    
    
    var id: Int
    var name: String
    var saponificationKOH: Double
    var saponificationNaOH: Double
    var bubbly: Double
    var cleaning: Double
    var condition: Double
    var hardness: Double
    var longevity: Double
    var isChosen: Bool
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
   
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userWeightValue)
    }

    static func == (lhs: Oil, rhs: Oil) -> Bool {
         lhs.userWeightValue == rhs.userWeightValue
    }
}
