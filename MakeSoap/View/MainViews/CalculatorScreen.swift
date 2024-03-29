//
//  CalculatorScreen.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI


struct CalculatorScreen: View {
    
    @State var selection: Int? = nil
    @StateObject var oilVM =  OilViewModel()
    @State private var showErrorAlert = false
    @State private var alertMessage = ""
    
    var gesture: _EndedGesture<TapGesture> {  TapGesture().onEnded {
        
        oilVM.calculate()
    }
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                ProcessView()
                    .padding()
                SoapTypeView()
                    .padding()
                WaterParametersView()
                    .padding()
                SuperfatView()
                    .padding()
                OilView()
                    .padding()
                EssentialOilView()
                    .padding()
                
                
                NavigationLink(destination: CalculatedRecipeView().environmentObject(oilVM)) {
                    GreenButton(title: String(localized: "Calculate"))
                }
                .simultaneousGesture(gesture)
                .disabled(isAllInfoNotProvided())
                .onTapGesture {
                    showErrorAlert = isAllInfoNotProvided()
                    alertMessage = NSLocalizedString(alertErrorMessage(), comment: "error messages")
                    !showErrorAlert ? oilVM.calculate() : nil
                }
                
                .alert("Not all info provided", isPresented: $showErrorAlert) {
                    Button("Got it!", role: .cancel) {}
                } message: {
                    Text(alertMessage)
                }
                
            }
            .navigationTitle("Calculator")
            .background(Color(UIColor.systemGray6))//
            
        }
        .navigationViewStyle(.stack)
        .environmentObject(oilVM)
    }
    
    func isAllInfoNotProvided() -> Bool {
        if !(oilVM.isColdProcess || oilVM.isHotProcess) || !(oilVM.isSolid || oilVM.isLiquid || oilVM.isHybrid) || oilVM.totalOilAmount.isZero || oilVM.sumOfLyesErroMessage != nil || (oilVM.isPerc && oilVM.percLeft != 0) {
            return true
        } else {
             return false
         }
    }
    
    func alertErrorMessage() -> String{
        switch isAllInfoNotProvided() {
            case !(oilVM.isColdProcess || oilVM.isHotProcess):
                return "Choose the soap making process."
            case !(oilVM.isSolid || oilVM.isHotProcess || oilVM.isHybrid):
                return "Choose the soap type."
            case !(oilVM.isSolid || oilVM.isLiquid || oilVM.isHybrid)  && !(oilVM.isColdProcess || oilVM.isHotProcess):
                return "The soap making process and the soap type are not chosen."
            case oilVM.totalOilAmount.isZero:
                return "Oil amount is not provided."
            case !(oilVM.isSolid || oilVM.isLiquid || oilVM.isHybrid)  && oilVM.totalOilAmount == 0:
                return "Choose the soap type and provide oil amount."
            case !(oilVM.isColdProcess || oilVM.isHotProcess)  && oilVM.totalOilAmount == 0:
                return "Choose the soap making process and provide oil amount."
            case (oilVM.isPerc && oilVM.percLeft != 0):
                return "Make sure that your percentage ratio is equal to 100%."
            case oilVM.sumOfLyesErroMessage != nil:
                return "Make sure that the sum of NaOh and KOH is equal to 100%."
            default:
                return "Make sure, that you provided all necessery info to calculate soap recipe."
        }
    }
    
}

struct CalculatorScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CalculatorScreen()
    }
}
