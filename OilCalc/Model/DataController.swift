//
//  DataController.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 22/03/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "OilCalculator")
    
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failes to load data: \(error.localizedDescription)")
            }
        }
    }
}

func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}
