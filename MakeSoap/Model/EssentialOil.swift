//
//  EssentialOil.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation

class EssentialOil: Codable, ObservableObject {
    
    internal init(name: String, latinName: String, blendsWith: String, rate: Double, scent: String, userPercent: Double? = nil, calculatedWeight: Double? = nil, id: Int) {
        self.name = name
        self.latinName = latinName
        self.blendsWith = blendsWith
        self.rate = rate
        self.scent = scent
        self.userPercent = userPercent
        self.calculatedWeight = calculatedWeight
        self.id = id
    }
    
    
    var name: String
    var latinName: String
    var blendsWith: String
    var rate: Double
    var scent: String
    var userPercent: Double?
    var calculatedWeight: Double?
    var id: Int
    
    var isInRecipe: Bool {
        if EssentialOilStore(isDefaultData: false).chosenEsOils.contains(where: {$0.name == name}) {
            return true
        } else {
            return false
        }
    }
    
    
    static func example() -> EssentialOil {
        EssentialOil(name: "Tea Tree Essential Oil", latinName: "Melaleuca alternifolia", blendsWith: "lavender, peppermint, clary sage, pine Scotch, thyme", rate: 3, scent: "fresh, antiseptic, mint, spicy, camphorous", userPercent: 5, calculatedWeight: 50, id: 41)
    }
}
