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
        
        VStack(spacing: 10) {
        HStack  {
            Text("Ingredients")
                .modifier(TitleModifier())
            Spacer()
        }
        Spacer()
                .frame(height: 15)
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
                LyeView(lye: "NaOH", lyeAmount: recipe.NaOHvalue ?? 0, unit: recipe.unit ?? "")
            } else if recipe.isLiquidSoap ?? false {
                LyeView(lye: "KOH", lyeAmount: recipe.KOHValue ?? 0, unit: recipe.unit ?? "")
            } else {
                LyeView(lye: "NaOH", lyeAmount: recipe.NaOHvalue ?? 0, unit: recipe.unit ?? "")
                LyeView(lye: "KOH", lyeAmount: recipe.KOHValue ?? 0, unit: recipe.unit ?? "")
            }
            
            if recipe.waterValue != nil && recipe.waterPerc != nil {
                
                ParameterValuePercView(parameterName: "Water", value: recipe.waterValue!, perc: recipe.extraWaterPerc!, unit: recipe.unit ?? "")
            }
            if  recipe.isHotProcess ?? false && recipe.extraWater != nil && recipe.extraWaterPerc != nil {
                ParameterValuePercView(parameterName: "Extra water", value: recipe.extraWater!, perc: recipe.extraWaterPerc!, unit: recipe.unit ?? "")
                    
            }
            if recipe.sfValue != nil && recipe.sfPerc != nil {
               
                ParameterValuePercView(parameterName: "Superfat", value: recipe.sfValue!, perc: recipe.sfPerc!, unit: recipe.unit ?? "")
            
            }
            if recipe.isHotProcess ?? false && recipe.extraSFValue != nil && recipe.extraSFPerc != nil {
                
                ParameterValuePercView(parameterName: "Extra superfat", value: recipe.extraSFValue!, perc: recipe.extraSFPerc!, unit: recipe.unit ?? "")
                


            }
            if recipe.oils != nil {
                ForEach(recipe.oils!, id: \.id) { oil in
                    
                    OilRecipeRow(oil: oil, unit: recipe.unit ?? "")
                }
            }
            if recipe.esOils != nil {
                ForEach(recipe.esOils!, id: \.id) { esOil in
                    EsOilRecipeRow(esOil: esOil, unit: recipe.unit ?? "")
                }
            }
        }
    }
    
}

struct RecipeSoapIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSoapIngredientsView(recipe: Recipe.example())
    }
}

struct LyeView: View {
    let lye: String
    let lyeAmount: Double
    let unit: String
    var body: some View {
        
        HStack {
            Text(lye)
                .modifier(Title2Modifier())
            Spacer()
            Text("\(lyeAmount, specifier: "%.2f") \(unit)")
                .modifier(TextStyleModifier())

        }
    }
}
