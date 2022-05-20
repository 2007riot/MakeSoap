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
                .modifier(Title2Modifier())
            Button {
                showInfoSheet.toggle()
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.callout)
            }
            Spacer()
            Text("\(value, specifier: "%.0f") %")
                .bold()
                .font(.title3)
                .foregroundColor(color)
                .frame(maxWidth: 100, alignment: .leading)
            Text("\(recomendedValue) %")
                .font(.title3)
                .frame(maxWidth: 100, alignment: .trailing)
        }
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            Text(recomendationText)
                .padding()
        })
    }
}


