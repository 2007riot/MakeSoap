//
//  OilStore.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 23/03/22.
//

import Foundation
class OilStore: ObservableObject {
    
    @Published var oils: [Oil] = []
    @Published var chosenOils: [Oil] = []
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(chosenOils) {
            UserDefaults.standard.set(encoded, forKey: Keys.oilData)
        }
    }
    
    
    init (isDefaultData: Bool) {
        if isDefaultData {
            self.oils = DataManager.shared.load("oilsData.json")
        } else {
            if let data = UserDefaults.standard.data(forKey: Keys.oilData) {
                if let decoded = try? JSONDecoder().decode([Oil].self, from: data) {
                    chosenOils = decoded
                    return
                }
            } else {
                chosenOils = []
            }
        }
        
    }
    
}

