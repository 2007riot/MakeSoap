//
//  CalculatedOolRow.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 24/03/22.
//

import SwiftUI

struct CalculatedOilRow: View {
    @EnvironmentObject var oilVM: OilViewModel
    var oil: Oil
    let unit: String
    var body: some View {
        HStack(alignment: .bottom) {
            Text(oil.name)
                .font(.title3)
                .fontWeight(.medium)
            Spacer()
            Text("\(oil.userWeightValue ?? 0, specifier: "%.2f") \(unit)")
                .font(.title3)
                //.foregroundColor(.gray)
                .frame(maxWidth: 100, alignment: .leading)
                .multilineTextAlignment(.trailing)
           
            Text("\(oil.userPercent ?? 0, specifier: "%.2f") %")
                .modifier(TextStyleModifier())
            
        }
    }
}


