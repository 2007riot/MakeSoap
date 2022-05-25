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
        
    var body: some View {
        ScrollView {
            SoapPropertiesView()
            .padding()
            SoapIngredientsView()
                .padding()
            Button (action: {
                isAlertShowing.toggle()
                
                
            }, label: {
               GreenButton(title: "Save Recipe")
            })
              
        }
        .environmentObject(oilVM)
        .onDisappear(perform: {
            oilVM.deleteCalculation()
        })
        .navigationBarTitle("Recipe", displayMode: .inline)
        .textFieldAlert(isPresented: $isAlertShowing) {
            TextFieldAlert(title: "Enter a recipe name", message: "", recipeName: $oilVM.recipeTitle) { textFieldTitle in
                RecipeManager.shared.create(
                    recipe: Recipe(title: textFieldTitle,
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
                                   extraWater: oilVM.extraWaterAmount,
                                   sfValue: oilVM.sfValue,
                                   extraSFValue: oilVM.extraSFValue,
                                   esOils: oilVM.chosenEsOils,
                                   date: .now)
                )
            }
        }
        
}
}

