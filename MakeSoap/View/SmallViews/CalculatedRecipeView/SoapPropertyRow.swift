//
//  SoapPropertyRow.swift
//  Make Soap!
//
//  Created by Galina Aleksandrova on 10/05/22.
//

import SwiftUI

struct SoapPropertyRow: View {
    @State var showInfoSheet = false
    
    let name: String
    let recomendedValue: String
    let value: Double
    let color: Color
    let recomendationText: String
    var body: some View {
        HStack {
            Text(name)
                .font(.title3)
               //.modifier(Title2Modifier())
            Button {
                showInfoSheet.toggle()
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.caption2)
            }
            Spacer()
            Text("\(value, specifier: "%.0f") %")
                .modifier(TextStyleModifier())
        }
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            Text(recomendationText)
                .padding()
        })
    }
}


