//
//  EssentialOil.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation
class EssentialOil: Codable, ObservableObject {
    
    var name: String
    var latinName: String
    var blendsWith: String
    var rate: Double
    var scent: String
    var isChosen: Bool
    var userPercent: Double?
    var calculatedWeight: Double?
    var id: Int
}
