//
//  ProcessView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import PartialSheet
import SwiftUI

struct ProcessView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Process")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .partialSheet(isPresented: $showInfoSheet,
                              type: .scrollView(height: UIScreen.main.bounds.height * 0.5, showsIndicators: false),
                              iPhoneStyle: UIConstants.iPhoneStyle,
                              content: {
                    ProcessViewInfo()
                        .padding()
                })
            } else {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .popover(isPresented: $showInfoSheet) {
                    ProcessViewInfo()
                        .padding()
                }
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
    }
}

struct ProcessView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        ProcessView()
            .environmentObject(oilVM)
    }
}


