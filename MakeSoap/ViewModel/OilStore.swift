//
//  OilStore.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 23/03/22.
//

import Foundation
class OilStore: ObservableObject {
    
    @Published var oils: [Oil] = []
   
    func saveData() {
        if let encoded = try? JSONEncoder().encode(oils) {
                UserDefaults.standard.set(encoded, forKey: oilDataKey)
            }
    }
    
    
    init (isDefaultData: Bool) {
        if isDefaultData {
            self.oils = DataManager.shared.load("oilsData.json")
        } else {
            if let data = UserDefaults.standard.data(forKey: oilDataKey) {
                    if let decoded = try? JSONDecoder().decode([Oil].self, from: data) {
                       oils = decoded
                        return
                    }
            }
            self.oils = DataManager.shared.load("oilsData.json")
        }
        
        }
    
    }

