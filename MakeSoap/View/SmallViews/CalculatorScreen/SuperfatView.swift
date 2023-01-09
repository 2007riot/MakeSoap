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
                
                
                if #available(iOS 16, *) {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .sheet(isPresented: $showInfoSheet) {
                            SuperfatInfoView()
                                .presentationDetents([.height(UIScreen.main.bounds.height * 0.4)])
                                .padding()
                        }
                } else {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .partialSheet(isPresented: $showInfoSheet,
                                      type: .scrollView(height: UIScreen.main.bounds.height * 0.4, showsIndicators: false),
                                      iPhoneStyle: UIConstants.iPhoneStyle,
                                      content: {
                            SuperfatInfoView()
                                .padding()
                        })
                }
            } else {
                GreenQuestionButtonView(isToggled: $showInfoSheet)
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


