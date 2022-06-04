//
//  SoapProperties.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 31/03/22.
//

import Foundation
import SwiftUI

struct SoapProperty: Codable, Identifiable {
    
    var id = UUID()
    var name: String
//    var recomendedValue: String
    var value: Double
    //var color: Color
//    var recomendationText: String
    
}
