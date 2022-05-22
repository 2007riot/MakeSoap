//
//  RecipeDetailView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 17/05/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack (spacing: 25)  {
            HStack  {
        Text("Ingredients")
                    .modifier(TitleModifier())
                Spacer()
            }
            if let oils = recipe.oils {
                VStack (spacing: 20) {
            ForEach(oils, id: \.id) { o in
                CalculatedOilRow(oil: o, unit: recipe.unit)
                
            }
                }
            }
            Text("Soap Properties")
            SoapPropertyRecipeRow(name: "Bubbly", value: recipe.bubblyValue ?? 0)
            SoapPropertyRecipeRow(name: "Cleaning", value: recipe.conditionValue ?? 0)
            SoapPropertyRecipeRow(name: "Condition", value: recipe.conditionValue ?? 0)
            SoapPropertyRecipeRow(name: "Hardness", value: recipe.hardnessValue ?? 0)
            SoapPropertyRecipeRow(name: "Longevity", value: recipe.longevityValue ?? 0)
            SoapPropertyRecipeRow(name: "Stability", value: recipe.stabilityValue ?? 0)
        }
        .padding()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(title: "Galina", oils: OilStore(defaultData: true).oils, bubblyValue: 50, cleaningValue: 50, conditionValue: 50, hardnessValue: 50, longevityValue: 50, stabilityValue: 50, unit: "gr", NaOHvalue: 10, KOHValue: 10, soapWeight: 10, waterValue: 10, extraWater: 10, sfValue: 10, extraSFValue: 10, esOils: EssentialOilsStore().essentialOils))
    }
}