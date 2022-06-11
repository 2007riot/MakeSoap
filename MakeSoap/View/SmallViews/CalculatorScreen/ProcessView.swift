//
//  ProcessView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct ProcessView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Process")
            Button {
                showInfoSheet.toggle()
            } label: {
                GreenQuestionButtonView()
            }
            
        }
        ) {
            
            HStack {
                Text("Cold Process")
                Spacer()
                
                
                oilVM.isColdProcess ?  Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    oilVM.isColdProcess.toggle()
                    oilVM.isHotProcess = false
                }
            }
            Divider()
            HStack {
                Text("Hot Process")
                Spacer()
                oilVM.isHotProcess ?  Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
                
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    oilVM.isHotProcess.toggle()
                    oilVM.isColdProcess = false
                }
            }
            
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
        
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            ProcessViewInfo()
                .padding()
        })
    }
}

struct ProcessView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        ProcessView()
            .environmentObject(oilVM)
    }
}


