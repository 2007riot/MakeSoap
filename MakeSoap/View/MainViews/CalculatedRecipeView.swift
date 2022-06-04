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
    var body: some View {
        
        ScrollView {
            
            SoapPropertiesView()
                .padding()
            SoapIngredientsView()
                .padding()
            Button  {
                isAlertShowing.toggle()
                
            } label: {
                GreenButton(title: "Save Recipe")
            }
        }
        .environmentObject(oilVM)
        .onDisappear(perform: {
            oilVM.deleteCalculation()
        })
        .navigationBarTitle("Recipe", displayMode: .inline)
        .textFieldAlert(isPresented: $isAlertShowing) {
            TextFieldAlert(title: "Recipe name", message: "", recipeName: $oilVM.recipeTitle) { textFieldTitle in
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

