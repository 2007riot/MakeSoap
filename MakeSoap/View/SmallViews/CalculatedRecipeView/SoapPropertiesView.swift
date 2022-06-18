//
//  soapPropertiesView.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 10/05/22.
//

import SwiftUI

struct SoapPropertiesView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @Binding var showBubbly: Bool
    @Binding var showCleansing: Bool
    @Binding var showCondition: Bool
    @Binding var showHardness: Bool
    @Binding var showLongevity: Bool
    @Binding var showStability: Bool
    
    
    var body: some View {
        VStack(spacing: 12) {
            HStack  {
                Text("Soap Properties")
                    .modifier(TitleModifier())
                Spacer()
            }
            
            VStack (spacing: 8) {
            //hardness
                SoapPropertyRow(showInfoSheet: $showHardness, name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, color: oilVM.hardnessColor, recomendationText: oilVM.hardnessSuggestion, propertyExplained: oilVM.hardnessExplained)
            //condition
                SoapPropertyRow(showInfoSheet: $showCondition, name: "Condition", recomendedValue: "45-70", value: oilVM.conditionInd, color: oilVM.conditionColor, recomendationText: oilVM.conditionSuggestion, propertyExplained: oilVM.conditionExplained)
            //bubbly
                SoapPropertyRow(showInfoSheet: $showBubbly, name: "Bubbly", recomendedValue: "15-30", value: oilVM.bubblyInd, color: oilVM.bubblyColor, recomendationText: oilVM.bubblySuggestion, propertyExplained: oilVM.bubblyExplained)
            //cleansing
                SoapPropertyRow(showInfoSheet: $showCleansing, name: "Cleansing", recomendedValue: "10-20", value: oilVM.cleaningInd, color: oilVM.cleaningColor, recomendationText: oilVM.cleaningSuggestion, propertyExplained: oilVM.cleaningExplained)
            //stability
                SoapPropertyRow(showInfoSheet: $showStability, name: "Stability", recomendedValue: "15-50", value: oilVM.stabilityInd, color: oilVM.stabilityColor, recomendationText: oilVM.stabilitySuggestion, propertyExplained: oilVM.stabilityExplained)
            //longevity
                SoapPropertyRow(showInfoSheet: $showLongevity, name: "Longevity", recomendedValue: "25-50", value: oilVM.longevityInd, color: oilVM.longevityColor, recomendationText: oilVM.longevitySuggestion, propertyExplained: oilVM.longevityExplained)
            
            //iodine, for now don't need
//            SoapPropertyRow(name: "Iodine", recomendedValue: "up to 50", value: oilVM.iodineInd, color: oilVM.iodineColor, recomendationText: oilVM.iodineSuggestion)
            }
            }
        }
    
}

struct soapPropertiesView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapPropertiesView(showBubbly: .constant(false), showCleansing: .constant(false), showCondition: .constant(false), showHardness: .constant(false), showLongevity: .constant(false), showStability: .constant(false))
            .environmentObject(oilVM)
            .padding()
    }
}
