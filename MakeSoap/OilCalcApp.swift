//
//  OilCalcApp.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

@main
struct OilCalcApp: App {
    @StateObject private var oilVM: OilViewModel
    
    init() {
        _oilVM = StateObject(wrappedValue: OilViewModel())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(oilVM)
        }
    }
}
