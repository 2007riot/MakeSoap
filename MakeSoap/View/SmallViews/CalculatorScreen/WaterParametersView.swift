//
//  WaterParametersView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 04/03/22.
//
import PartialSheet
import SwiftUI

struct WaterParametersView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var showInfoSheet = false
    
    var body: some View {
        GroupBox(label:
                    HStack {
            Text("Water")
                .modifier(TitleModifier())
            if UIDevice.current.userInterfaceIdiom == .phone {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                } //MARK: adjust height of the sheet based on the content
                .partialSheet(isPresented: $showInfoSheet,
                              type: .scrollView(height: UIScreen.main.bounds.height * 0.5, showsIndicators: false),
                              iPhoneStyle: UIConstants.iPhoneStyle,
                              content: {
                    WaterInfoView()
                        .padding()
                })
            } else {
                Button {
                    showInfoSheet.toggle()
                } label: {
                    GreenQuestionButtonView()
                }
                .popover(isPresented: $showInfoSheet) {
                    WaterInfoView()
                        .padding()
                }
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
                        }
                    }
                ) : nil
            }
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
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


