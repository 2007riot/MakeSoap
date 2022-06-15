//
//  SuperfatView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 09/03/22.
//

import PartialSheet
import SwiftUI

struct SuperfatView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Superfat")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                } //MARK: adjust height of the sheet based on the content
                .partialSheet(isPresented: $showInfoSheet,
                              type: .scrollView(height: UIScreen.main.bounds.height * 0.4, showsIndicators: false),
                              iPhoneStyle: UIConstants.iPhoneStyle,
                              content: {
                    SuperfatInfoView()
                        .padding()
                })
            } else {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .popover(isPresented: $showInfoSheet) {
                    SuperfatInfoView()
                        .padding()
                }
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
    }
}

struct SuperfatView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SuperfatView()
            .environmentObject(oilVM)
    }
}


