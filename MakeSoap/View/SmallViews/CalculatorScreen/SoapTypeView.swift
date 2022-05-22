//
//  SoapTypeView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct SoapTypeView: View {
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Soap Type")
            Button {
                showInfoSheet.toggle()
            } label: {
                GreenQuestionButtonView()
            }
        }) {
            
            HStack {
                Text("Solid Soap")
                Spacer()
                oilVM.isSolid ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    oilVM.isSolid.toggle()
                    oilVM.isLiquid = false
                    oilVM.isHybrid = false
                }
            }
            Divider()
            HStack {
                Text("Liquid Soap")
                Spacer()
                oilVM.isLiquid ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    oilVM.isLiquid.toggle()
                    oilVM.isSolid = false
                    oilVM.isHybrid = false
                }
            }
            Divider()
            HStack {
                Text("Hybrid")
                Spacer()
                oilVM.isHybrid ? Image(systemName: "checkmark").foregroundColor(.accentColor) : nil
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    oilVM.isHybrid.toggle()
                    oilVM.isSolid = false
                    oilVM.isLiquid = false
                }
            }
            oilVM.isHybrid ? (
                VStack {
                    Divider()
                    HStack {
                        Text("NaOH")
                        Spacer()
                        TextField("No value", value: $oilVM.hybridNaOHPercent, format: .number, prompt: Text("No value"))
                            .modifier(TextFieldStyle())
                        Text("%")
                    }
                    Divider()
                    HStack {
                        Text("KOH")
                        Spacer()
                        TextField("No value", value: $oilVM.hybridKOHPercent, format: .number, prompt: Text("No value"))
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
            ProcessViewInfo()
        })
    }
    
}


struct SoapTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SoapTypeView()
    }
}

struct SoapTypeInfoView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Soap Type")
        }
    }
}