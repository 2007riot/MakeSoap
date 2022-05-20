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
            Spacer()
            Text("\(value, specifier: "%.0f")")
        }
    }
}


