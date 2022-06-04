//
//  LyeView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct LyeView: View {
    
    let lye: String
    let lyeAmount: Double
    let unit: String
    var body: some View {
        
        HStack {
            Text(lye)
                .modifier(Title2Modifier())
            Spacer()
            Text("\(lyeAmount, specifier: "%.2f") \(unit)")
                .modifier(TextStyleModifier())
            
        }
    }
}

struct LyeView_Previews: PreviewProvider {
    static var previews: some View {
        LyeView(lye: "NaOH", lyeAmount: 30, unit: "g")
    }
}
