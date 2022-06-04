//
//  SuperfatView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 09/03/22.
//

import SwiftUI

struct SuperfatView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Seperfat")
            Button {
                showInfoSheet.toggle()
            } label: {
                GreenQuestionButtonView()
            }
        })
        {
            
            HStack {
                Text("Superfat")
                Spacer()
                
                TextField("Value", value: $oilVM.sfPercent, format: .number)
                    .modifier(TextFieldStyle())
                Text("%")
                
            }
            
            oilVM.isHotProcess ? (
                Group {
                    Divider()
                    HStack {
                        Text("Extra superfat")
                        Spacer()
                        TextField("Value", value: $oilVM.extraSFPercent, format: .number)
                            .modifier(TextFieldStyle())
                        Text("%")
                    }
                }
            ) : nil
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            SuperfatInfoView()
        })
        
        
        
    }
}

struct SuperfatView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SuperfatView()
            .environmentObject(oilVM)
    }
}


