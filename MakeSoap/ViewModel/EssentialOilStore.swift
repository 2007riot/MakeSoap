//
//  EssentialOilsStore.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation

class EssentialOilStore: ObservableObject {
    
    @Published var esOils = [EssentialOil]()
    @Published var chosenEsOils = [EssentialOil]()
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(chosenEsOils) {
            UserDefaults.standard.set(encoded, forKey: Keys.esOilData)
        }
    }
    
    init (isDefaultData: Bool) {
        if isDefaultData {
            self.esOils = DataManager.shared.load("EssentialOilsData.json")
        } else {
            if let data = UserDefaults.standard.data(forKey: Keys.esOilData) {
                if let decoded = try? JSONDecoder().decode([EssentialOil].self, from: data) {
                    chosenEsOils = decoded
                    return
                }
            } else {
                chosenEsOils = []
            }
        }
        
    }
}
