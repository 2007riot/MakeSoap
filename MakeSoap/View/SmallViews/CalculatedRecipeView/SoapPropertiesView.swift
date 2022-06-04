//
//  soapPropertiesView.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 10/05/22.
//

import SwiftUI

struct SoapPropertiesView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack  {
                Text("Soap Properties")
                    .modifier(TitleModifier())
                Spacer()
            }
            Spacer()
                .frame(height: 15)
            //bubbly
            SoapPropertyRow(name: "Bubbly", recomendedValue: "15-30", value: oilVM.bubblyInd, color: oilVM.bubblyColor, recomendationText: oilVM.bubblySuggestion)
            //cleaning
            SoapPropertyRow(name: "Cleaning", recomendedValue: "15-20", value: oilVM.cleaningInd, color: oilVM.cleaningColor, recomendationText: oilVM.cleaningSuggestion)
            //condition
            SoapPropertyRow(name: "Condition", recomendedValue: "45-70", value: oilVM.conditionInd, color: oilVM.conditionColor, recomendationText: oilVM.conditionSuggestion)
            //hardness
            SoapPropertyRow(name: "Hardness", recomendedValue: "35-45", value: oilVM.hardnessInd, color: oilVM.hardnessColor, recomendationText: oilVM.hardnessSuggestion)
            //longevity
            SoapPropertyRow(name: "Longevity", recomendedValue: "25-50", value: oilVM.longevityInd, color: oilVM.longevityColor, recomendationText: oilVM.longevitySuggestion)
            //stability
            SoapPropertyRow(name: "Stability", recomendedValue: "15-50", value: oilVM.stabilityInd, color: oilVM.stabilityColor, recomendationText: oilVM.stabilitySuggestion)
            //iodine, for now don't need
//            SoapPropertyRow(name: "Iodine", recomendedValue: "up to 50", value: oilVM.iodineInd, color: oilVM.iodineColor, recomendationText: oilVM.iodineSuggestion)
            }
        }
    
}

struct soapPropertiesView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapPropertiesView()
            .environmentObject(oilVM)
            .padding()
    }
}
