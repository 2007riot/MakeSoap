//
//  SoapIngridientsView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 14/03/22.
//

import SwiftUI


struct SoapIngredientsView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    
    var body: some View {
        
        VStack(spacing: 12) {
            HStack  {
                Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
            VStack (spacing: 12) {
            HStack(alignment: .top) {
                Text("Total soap weight")
                    .modifier(Title2ModifierSemibold())
                Spacer()
                Text("\(oilVM.totalSoapWeight, specifier: "%.2f") \(NSLocalizedString(oilVM.si, comment: "unit"))")
                    .modifier(Title2ModifierSemibold())
                // .fontWeight(.bold)
                
            }
            
            
            if oilVM.isSolid || oilVM.isHybrid {
                
                OnlyValueView(valueName: "NaOH", valueAmount: oilVM.totalAmountNaOH, unit: NSLocalizedString(oilVM.si, comment: "unit"))
            }
            if oilVM.isLiquid || oilVM.isHybrid {
                
                OnlyValueView(valueName: "KOH", valueAmount: oilVM.totalAmountKOH, unit: NSLocalizedString(oilVM.si, comment: "unit"))
            }
            
            if oilVM.waterPercent != nil {
                
                ParameterValuePercView(parameterName: NSLocalizedString("Water", comment: "Water"), value: oilVM.totalWaterAmount, perc: oilVM.waterPercent!, unit: NSLocalizedString(oilVM.si, comment: "unit"))
            }
            if oilVM.isHotProcess && oilVM.extraWaterPercent != nil {
                
                ParameterValuePercView(parameterName: NSLocalizedString("Extra water", comment: "Extra water"), value: oilVM.extraWaterAmount, perc: oilVM.extraWaterPercent!, unit: NSLocalizedString(oilVM.si, comment: "unit"))
            }
            if oilVM.sfPercent != nil {
                
                OnlyValueView(valueName: NSLocalizedString("Superfat", comment: "Superfat"), valueAmount: oilVM.sfPercent!, unit: "%")
            }
            
            if oilVM.isHotProcess && oilVM.extraSFPercent != nil {
                
                ParameterValuePercView(parameterName: NSLocalizedString("Extra superfat", comment: "Extra superfat"), value: oilVM.extraSFValue, perc: oilVM.extraSFPercent!, unit: NSLocalizedString(oilVM.si, comment: "unit"))
            }
            Group {
                
                ForEach(oilVM.chosenOils, id: \.id) { oil in
                    
                    ParameterValuePercView(parameterName: NSLocalizedString(oil.name, comment: "oil name").capitalized, value: oil.userWeightValue ?? 0, perc: oil.userPercent ?? 0, unit: NSLocalizedString(oilVM.si, comment: "unit"))
                }
                
                    
                ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                    
                    ParameterValuePercView(parameterName: ("\(NSLocalizedString(esOil.name, comment: "es oil name")), \(NSLocalizedString("essential oil", comment: "Es oil").lowercased())"), value: esOil.calculatedWeight ?? 0, perc: esOil.userPercent ?? 0, unit: NSLocalizedString(oilVM.si, comment: "unit"))
                }
            }
        }
        }
    }
}

struct SoapIngredientsView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapIngredientsView()
            .environmentObject(oilVM)
            .padding()
            
    }
}
