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
        
        VStack(spacing: 10) {
            HStack  {
                Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
            Spacer()
                .frame(height: 15)
            HStack(alignment: .top) {
                Text("Total soap weight")
                    .modifier(Title2ModifierSemibold())
                Spacer()
                Text("\(oilVM.totalSoapWeight, specifier: "%.2f") \(oilVM.si)")
                    .modifier(Title2ModifierSemibold())
                // .fontWeight(.bold)
                
            }
            
            
            if oilVM.isSolid || oilVM.isHybrid {
                
                LyeView(lye: "NaOH", lyeAmount: oilVM.totalAmountNaOH, unit: oilVM.si)
            }
            if oilVM.isLiquid || oilVM.isHybrid {
                
                LyeView(lye: "KOH", lyeAmount: oilVM.totalAmountKOH, unit: oilVM.si)
            }
            
            if oilVM.waterPercent != nil {
                
                ParameterValuePercView(parameterName: "Water", value: oilVM.totalWaterAmount, perc: oilVM.waterPercent!, unit: oilVM.si)
            }
            if oilVM.isHotProcess && oilVM.extraWaterPercent != nil {
                
                ParameterValuePercView(parameterName: "Extra water", value: oilVM.extraWaterAmount, perc: oilVM.extraWaterPercent!, unit: oilVM.si)
            }
            if oilVM.sfPercent != nil {
                
                ParameterValuePercView(parameterName: "Superfat", value: oilVM.sfValue, perc: oilVM.sfPercent!, unit: oilVM.si)
            }
            
            if oilVM.isHotProcess && oilVM.extraSFPercent != nil {
                
                ParameterValuePercView(parameterName: "Extra superfat", value: oilVM.sfValue, perc: oilVM.sfPercent!, unit: oilVM.si)
            }
            Group {
                
                ForEach(oilVM.chosenOils, id: \.id) { oil in
                    
                    ParameterValuePercView(parameterName: oil.name, value: oil.userWeightValue ?? 0, perc: oil.userPercent ?? 0, unit: oilVM.si)
                }
                
                ForEach(oilVM.chosenEsOils, id: \.id) { esOil in
                    
                    ParameterValuePercView(parameterName: esOil.name, value: esOil.calculatedWeight ?? 0, perc: esOil.userPercent ?? 0, unit: oilVM.si)
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
