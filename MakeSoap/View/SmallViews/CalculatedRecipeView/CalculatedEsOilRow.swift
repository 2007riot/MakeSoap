//
//  CalculatedEsOilRow.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 08/05/22.
//

import SwiftUI

struct CalculatedEsOilRow: View {
    @EnvironmentObject var oilVM: OilViewModel
    var esOil: EssentialOil
    var body: some View {
        HStack(alignment: .bottom) {
            Text(esOil.name)
                .font(.title3)
                .fontWeight(.medium)
            Spacer()
            Text("\(esOil.calculatedWeight ?? 0, specifier: "%.2f") \(oilVM.si)")
                .font(.title3)
                //.foregroundColor(.gray)
                .frame(maxWidth: 100, alignment: .leading)
                .multilineTextAlignment(.trailing)
           
            Text("\(esOil.userPercent ?? 0, specifier: "%.1f") %")
                .modifier(TextStyleModifier())
            
        }
    }

}


