//
//  EssentialOilsStore.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation

class EssentialOilStore: ObservableObject {
    
    @Published var essentialOils: [EssentialOil] = []
    
    
    
    init () {
        essentialOils = DataManager.shared.load("EssentialOilsData.json")
    }
}
