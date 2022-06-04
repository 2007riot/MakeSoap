//
//  ParameterValuePercView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 04/06/22.
//

import SwiftUI

struct ParameterValuePercView: View {
    let parameterName: String
    let value: Double
    let perc: Double
    let unit: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(parameterName)
                .modifier(Title2Modifier())
            Spacer()
            VStack (alignment: .trailing, spacing: 2) {
                Text("\(value, specifier: "%.2f") \(unit)")
                    .modifier(TextStyleModifier())
                Text("\(perc, specifier: "%.1f") %")
                    .modifier(TextStyleModifier())
                    .foregroundColor(.gray)

            }
        }
    }
}

struct ParameterValuePercView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterValuePercView(parameterName: "Water", value: 330, perc: 33, unit: "oz")
    }
}
