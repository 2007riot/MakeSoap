//
//  SoapTypeView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import PartialSheet
import SwiftUI

struct SoapTypeView: View {
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Soap Type")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                if #available(iOS 16, *) {
                    
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                    
                        .sheet(isPresented: $showInfoSheet) {
                            
                            SoapTypeInfoView()
                                .presentationDetents([.height(UIScreen.main.bounds.height * 0.4)])
                                .padding()
                        }
                } else {
                    GreenQuestionButtonView(isToggled: $showInfoSheet)
                        .partialSheet(isPresented: $showInfoSheet,
                                      type: .scrollView(height: UIScreen.main.bounds.height * 0.4, showsIndicators: false),
                                      iPhoneStyle: UIConstants.iPhoneStyle,
                                      content: {
                            SoapTypeInfoView()
                                .padding()
                        })
                }
                
            } else {
                GreenQuestionButtonView(isToggled: $showInfoSheet)
                    .popover(isPresented: $showInfoSheet) {
                        SoapTypeInfoView()
                            .padding()
                    }
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
                        TextField("Value", value: $oilVM.hybridNaOHPercent, format: .number, prompt: Text("Value"))
                            .modifier(TextFieldStyle())
                            .onSubmit {
                                oilVM.calculateLyeSum()
                            }
                        Text("%")
                    }
                    Divider()
                    HStack {
                        Text("KOH")
                        Spacer()
                        TextField("Value", value: $oilVM.hybridKOHPercent, format: .number, prompt: Text("Value"))
                            .modifier(TextFieldStyle())
                            .onSubmit {
                                oilVM.calculateLyeSum()
                            }
                        Text("%")
                    }
                    if oilVM.sumOfLyesErroMessage != nil {
                        HStack {
                            Text(NSLocalizedString(oilVM.sumOfLyesErroMessage!, comment: "lye error message"))
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
            ) : nil
            
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
    }
}


struct SoapTypeView_Previews: PreviewProvider {
    
    static let oilVM = OilViewModel()
    
    static var previews: some View {
        SoapTypeView()
            .environmentObject(oilVM)
    }
}


struct ViewHeightKeyTestScreen: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
