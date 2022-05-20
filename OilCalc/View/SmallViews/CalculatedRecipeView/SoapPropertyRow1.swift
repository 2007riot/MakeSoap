////
////  SoapPropertyRow1.swift
////  Make Soap
////
////  Created by Galina Aleksandrova on 17/05/22.
////
//
//import Foundation
//import SwiftUI
//
//struct SoapPropertyRow1: View {
//    @State var showInfoSheet = false
//    
//    let property: SoapProperty
//    
//    var body: some View {
//        HStack {
//            Text(property.name)
//                .modifier(Title2Modifier())
//            Button {
//                showInfoSheet.toggle()
//            } label: {
//                Image(systemName: "questionmark.circle.fill")
//                    .foregroundColor(.accentColor)
//                    .font(.callout)
//            }
//            Spacer()
//            Text("\(property.value, specifier: "%.0f") %")
//                .bold()
//                .font(.title3)
//                .foregroundColor(property.color)
//                .frame(maxWidth: 100, alignment: .leading)
//            Text("\(property.recomendedValue) %")
//                .font(.title3)
//                .frame(maxWidth: 100, alignment: .trailing)
//        }
//        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
//            //nothing
//        }, content: {
//            Text(property.recomendationText)
//                .padding()
//        })
//    }
//}
