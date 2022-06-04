//
//  OilRecipeRow.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct OilRecipeRow: View {
    let oil: Oil
    let unit: String
    var body: some View {
        HStack(alignment: .top) {
            Text(oil.name)
                .modifier(Title2Modifier())
            Spacer()
            
            VStack (alignment: .trailing, spacing: 2) {
                Text("\(oil.userWeightValue ?? 0, specifier: "%.2f") \(unit)")
                    .modifier(TextStyleModifier())
                
                
                Text("\(oil.userPercent ?? 0, specifier: "%.2f") %")
                    .modifier(TextStyleModifier())
                    .foregroundColor(.gray)
                
            }
        }
    }
}

//struct OilRecipeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        OilRecipeRow()
//    }
//}

//HStack(alignment: .top) {
//    Text(oil.name)
//        .modifier(Title2Modifier())
//    Spacer()
//    
//    VStack (alignment: .trailing, spacing: 2) {
//        Text("\(oil.userWeightValue ?? 0, specifier: "%.2f") \(oilVM.si)")
//            .modifier(TextStyleModifier())
//        
//        
//        Text("\(oil.userPercent ?? 0, specifier: "%.2f") %")
//            .modifier(TextStyleModifier())
//            .foregroundColor(.gray)
//        
//    }
//}

