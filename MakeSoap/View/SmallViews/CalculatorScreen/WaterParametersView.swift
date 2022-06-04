//
//  WaterParametersView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 04/03/22.
//
import Combine
import SwiftUI

struct WaterParametersView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Water")
            Button {
                showInfoSheet.toggle()
            } label: {
                GreenQuestionButtonView()
            }
        }) {
            VStack {
                HStack {
                    Text("Water to oil")
                    Spacer()
                    TextField("Value", value: $oilVM.waterPercent, format: .number)
                            .modifier(TextFieldStyle())
                            
                    Text("%")
                            
                }
            oilVM.isHotProcess ? (
                Group {
                Divider()
                HStack {
                    Text("Extra water")
                    Spacer()
                    TextField("Value", value: $oilVM.extraWaterPercent, format: .number)
                        .modifier(TextFieldStyle())
                Text("%")
                }//.environmentObject(oilVM)
                }
                    
            
            ) : nil
        }
           
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
        .halfSheet(isPresented: $showInfoSheet, onDismiss: {
            //nothing
        }, content: {
            WaterInfoView()
        })
        .environmentObject(OilViewModel())
        
        
}
       
}

struct WaterParametersView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        WaterParametersView()
            .environmentObject(oilVM)
    }
}

struct WaterInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Water")
        }
    }
}
