//
//  CalculatedRecipeView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 06/03/22.
//
import Combine
import SwiftUI


struct CalculatedRecipeView: View {
    
    @EnvironmentObject var oilVM: OilViewModel
    @State var isAlertShowing = false
    @EnvironmentObject var recipeManager: RecipeManager
    @State private var showBubbly: Bool = false
    @State private var showCleansing: Bool = false
    @State private var showCondition: Bool = false
    @State private var showHardness: Bool = false
    @State private var showLongevity: Bool = false
    @State private var showStability: Bool = false
    var body: some View {
        
        
        GeometryReader { geometry in
        ScrollView {
            
            
                SoapPropertiesView(showBubbly: $showBubbly, showCleansing: $showCleansing, showCondition: $showCondition, showHardness: $showHardness, showLongevity: $showLongevity, showStability: $showStability)
                    .padding()
            
            SoapIngredientsView()
                .padding()
            Button  {
                isAlertShowing.toggle()
                
            } label: {
                GreenButton(title: String(localized: "Save Recipe"))
            }
        }
        .environmentObject(oilVM)
        .onDisappear(perform: {
            oilVM.deleteCalculation()
        })
        .navigationBarTitle("Recipe", displayMode: .inline)
        .textFieldAlert(isPresented: $isAlertShowing) {
            TextFieldAlert(title: String(localized: "Recipe name"), message: "", recipeName: $oilVM.recipeTitle) { textFieldTitle in
                recipeManager.create(
                    recipe: Recipe(title: textFieldTitle,
                                   soapMakingProcess: oilVM.soapMakingProcess,
                                   soapType: oilVM.soapType,
                                   isColdProcess: oilVM.isColdProcess,
                                   isHotProcess: oilVM.isHotProcess,
                                   isSolidSoap: oilVM.isSolid,
                                   isLiquidSoap: oilVM.isLiquid,
                                   isHybridSoap: oilVM.isHybrid,
                                   oils: oilVM.chosenOils,
                                   bubblyValue: oilVM.bubblyInd,
                                   cleaningValue: oilVM.cleaningInd,
                                   conditionValue: oilVM.conditionInd,
                                   hardnessValue: oilVM.hardnessInd,
                                   longevityValue: oilVM.longevityInd,
                                   stabilityValue: oilVM.stabilityInd,
                                   unit: oilVM.si,
                                   NaOHvalue: oilVM.totalAmountNaOH,
                                   KOHValue: oilVM.totalAmountKOH,
                                   soapWeight: oilVM.totalSoapWeight,
                                   waterValue: oilVM.totalWaterAmount,
                                   waterPerc: oilVM.waterPercent,
                                   extraWater: oilVM.extraWaterAmount,
                                   extraWaterPerc: oilVM.extraWaterPercent,
                                   sfValue: oilVM.sfValue,
                                   sfPerc: oilVM.sfPercent,
                                   extraSFValue: oilVM.extraSFValue,
                                   extraSFPerc: oilVM.extraSFPercent,
                                   esOils: oilVM.chosenEsOils,
                                   date: .now)
                )
            }
        }
        
        }
        .onTapGesture {
            showBubbly = false
            showCleansing = false
            showCondition = false
            showHardness = false
            showLongevity = false
            showStability = false
        }
    }
}

struct CalculatedRecipeView_Previews: PreviewProvider {
    
    static let recipeManager = RecipeManager()

    static let oilVM = OilViewModel()

    static var previews: some View {
        CalculatedRecipeView()
            .environmentObject(recipeManager)
            .environmentObject(oilVM)
    }
}

