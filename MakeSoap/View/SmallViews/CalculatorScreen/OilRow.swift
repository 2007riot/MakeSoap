//
//  OilRow.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 07/03/22.
//

import SwiftUI

struct OilRow: View {
    @EnvironmentObject var oil: Oil
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    var body: some View {
        
        HStack {
            Text(oil.name)
            Button {
                showInfoSheet.toggle()
            } label: {
            Image(systemName: "questionmark.circle.fill")
                .foregroundColor(.accentColor)
                .font(.caption2)
            }
                
            Spacer()
            TextField("Value", value: oilVM.isPerc ? $oil.userPercent : $oil.userWeightValue, format: .number)
                .modifier(TextFieldStyle())
                    .onChange(of: oilVM.isPerc ? oil.userPercent : oil.userWeightValue, perform: { _ in
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                        
                    })
                    
                    .onSubmit {
                        oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                        
                    }
                    
            Text(oilVM.isPerc ? "%" : oilVM.si)
            Button {
                withAnimation(.easeOut) {
                    oilVM.changeFavorite(oil: oil)
                    oilVM.isPerc ? oilVM.check100perc() : oilVM.calculateTotalOilWeight()
                    
                }
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .font(.caption2)
            }
        }
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            OilPropertyView(oil: oil)
                .padding()
        })
       
        Divider()
    }
}

