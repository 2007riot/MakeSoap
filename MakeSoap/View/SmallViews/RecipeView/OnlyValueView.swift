//
//  LyeView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct OnlyValueView: View {
    
    let valueName: String
    let valueAmount: Double
    let unit: String
    var body: some View {
        
        HStack {
            Text(valueName)
                .modifier(Title2Modifier())
            Spacer()
            Text("\(valueAmount, specifier: "%.2f") \(unit)")
                .modifier(TextStyleModifier())
            
        }
    }
}

struct LyeView_Previews: PreviewProvider {
    static var previews: some View {
        OnlyValueView(valueName: "NaOH", valueAmount: 30, unit: "g")
    }
}
