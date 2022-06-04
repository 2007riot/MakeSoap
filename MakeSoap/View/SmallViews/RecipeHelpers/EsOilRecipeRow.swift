//
//  EsOilRecipeRow.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct EsOilRecipeRow: View {
    
    let esOil: EssentialOil
    let unit: String
    var body: some View {
        
        HStack(alignment: .top) {
            Text(esOil.name)
                .modifier(Title2Modifier())
            Spacer()
            VStack (alignment: .trailing, spacing: 2) {
                Text("\(esOil.calculatedWeight ?? 0, specifier: "%.2f") \(unit)")
                    .modifier(TextStyleModifier())
                
                Text("\(esOil.userPercent ?? 0, specifier: "%.1f") %")
                    .modifier(TextStyleModifier())
                    .foregroundColor(.gray)
            }
        }

    }
}

//struct EsOilRecipeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        EsOilRecipeRow()
//    }
//}
