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
                    let CP = "false"
                    let url = getDocumentsDirectory().appendingPathComponent("CP")
                    oilVM.isColdProcess.toggle()
                    oilVM.isHotProcess = false
                    do {
                        try CP.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
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
        })
    }
}

struct ProcessView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessView()
    }
}

struct ProcessViewInfo: View {
    var body: some View {
        VStack (spacing: 10) {
            Text("Soap making process")
            Text("Cold process:")
                .modifier(TitleModifier())
            Text("")
            Text("Hot process")
                .modifier(TitleModifier())
            Text("")
            
        }
    }
}
