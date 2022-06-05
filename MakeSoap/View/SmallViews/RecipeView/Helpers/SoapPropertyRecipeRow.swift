//
//  SoapPropertyRecipeRow.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 17/05/22.
//

import SwiftUI

struct SoapPropertyRecipeRow: View {
    let name: String
    let value: Double
    var body: some View {
        HStack {
            Text(name)
                .modifier(Title2Modifier())
            Spacer()
            Text("\(value, specifier: "%.0f") %")
                .modifier(TextStyleModifier())
        }
    }
}

struct SoapPropertyRecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        SoapPropertyRecipeRow(name: "Bubbly property", value: 90)
            .padding()
    }
}
