//
//  EssentialOilsStore.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 04/05/22.
//

import Foundation

class EssentialOilStore: ObservableObject {
    
    @Published var esOils: [EssentialOil] = []
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(esOils) {
            UserDefaults.standard.set(encoded, forKey: Keys.esOilData)
        }
    }
    
    init (isDefaultData: Bool) {
        if isDefaultData {
            self.esOils = DataManager.shared.load("EssentialOilsData.json")
        } else {
            if let data = UserDefaults.standard.data(forKey: Keys.esOilData) {
                if let decoded = try? JSONDecoder().decode([EssentialOil].self, from: data) {
                    esOils = decoded
                    return
                }
            }
            self.esOils = DataManager.shared.load("EssentialOilsData.json")
        }
        
    }
    init () {
        
            if let data = UserDefaults.standard.data(forKey: Keys.esOilData) {
                if let decoded = try? JSONDecoder().decode([EssentialOil].self, from: data) {
                    esOils = decoded
                    return
                }
            } else {
            self.esOils = DataManager.shared.load("EssentialOilsData.json")
            }
        
    }
//    init () {
//        esOils = DataManager.shared.load("EssentialOilsData.json")
//    }
}
