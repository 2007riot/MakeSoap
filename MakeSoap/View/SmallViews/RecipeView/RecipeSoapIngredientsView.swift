//
//  RecipeSoapIngredientsView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 03/06/22.
//

import SwiftUI

struct RecipeSoapIngredientsView: View {
    let recipe: Recipe
    var body: some View {
        GroupBox {
            VStack(spacing: 12){
            if recipe.soapWeight != nil {
                HStack(alignment: .top) {
                    Text("Total soap weight")
                        .modifier(Title2ModifierSemibold())
                    Spacer()
                    Text("\(recipe.soapWeight!, specifier: "%.2f") \(recipe.unit ?? "")")
                        .modifier(Title2ModifierSemibold())
                }
            }
            
            if recipe.isSolidSoap ?? false {
                OnlyValueView(valueName: "NaOH", valueAmount: recipe.NaOHvalue ?? 0, unit: recipe.unit ?? "")
            } else if recipe.isLiquidSoap ?? false {
                OnlyValueView(valueName: "KOH", valueAmount: recipe.KOHValue ?? 0, unit: recipe.unit ?? "")
            } else {
                OnlyValueView(valueName: "NaOH", valueAmount: recipe.NaOHvalue ?? 0, unit: recipe.unit ?? "")
                OnlyValueView(valueName: "KOH", valueAmount: recipe.KOHValue ?? 0, unit: recipe.unit ?? "")
            }
            
            if recipe.waterValue != nil && recipe.waterPerc != nil {
                
                ParameterValuePercView(parameterName: "Water", value: recipe.waterValue!, perc: recipe.waterPerc!, unit: recipe.unit ?? "")
            }
            if  recipe.isHotProcess ?? false && recipe.extraWater != nil && recipe.extraWaterPerc != nil {
                ParameterValuePercView(parameterName: "Extra water", value: recipe.extraWater!, perc: recipe.extraWaterPerc!, unit: recipe.unit ?? "")
                
            }
                if recipe.sfPerc != nil {
                
                OnlyValueView(valueName: "Superfat", valueAmount: recipe.sfPerc!, unit: "%")
                
            }
            if recipe.isHotProcess ?? false && recipe.extraSFValue != nil && recipe.extraSFPerc != nil {
                
                ParameterValuePercView(parameterName: "Extra superfat", value: recipe.extraSFValue!, perc: recipe.extraSFPerc!, unit: recipe.unit ?? "")
                
            }
            if recipe.oils != nil {
                ForEach(recipe.oils!, id: \.id) { oil in
                    ParameterValuePercView(parameterName: oil.name, value: oil.userWeightValue ?? 0, perc: oil.userPercent ?? 0, unit: recipe.unit ?? "")
                }
            }
            if recipe.esOils != nil {
                ForEach(recipe.esOils!, id: \.id) { esOil in
                    ParameterValuePercView(parameterName: esOil.name, value: esOil.calculatedWeight ?? 0, perc: esOil.userPercent ?? 0, unit: recipe.unit ?? "")
                }
            }
        }
        } label: {
            HStack  {
                Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
    }
    
}

struct RecipeSoapIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSoapIngredientsView(recipe: Recipe.example())
    }
}


