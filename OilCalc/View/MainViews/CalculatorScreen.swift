//
//  CalculatorScreen.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI


struct CalculatorScreen: View {
    @State var selection: Int? = nil
    @StateObject var oilVM:  OilViewModel
    
    var gesture: _EndedGesture<TapGesture> {  TapGesture().onEnded {
        oilVM.calculate()
    }
    }
    init() {
        _oilVM = StateObject(wrappedValue: OilViewModel())
    }
    var body: some View {
        
        NavigationView {
            ScrollView {
                ProcessView()
                    .padding()
                SoapTypeView()
                    .padding()
                WaterParametersView()
                    .padding()
                SuperfatView()
                    .padding()
                OilView()
                    .padding()
                EssentialOilView()
                    .padding()
                
                
                NavigationLink(destination: CalculatedRecipeView().environmentObject(oilVM)) {
                    GreenButton(title: "Calculate")
                }
                //.disabled(oilVM.isPerc ? oilVM.isNot100Perc : false)
                .simultaneousGesture(gesture)
                .navigationTitle("Calculator")
                
            }
            .background(Color(UIColor.systemGray6))//
            
        }
        .environmentObject(oilVM)
    }
    
    
    
}

struct CalculatorScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorScreen()
    }
}
