//
//  RecipeSoapPropertiesView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 03/06/22.
//

import SwiftUI

struct RecipeSoapPropertiesView: View {
    let recipe: Recipe
    var body: some View {
        GroupBox {
            VStack (spacing: 12) {
                SoapPropertyRecipeRow(name: "Hardness", value: recipe.hardnessValue ?? 0)
                SoapPropertyRecipeRow(name: "Condition", value: recipe.conditionValue ?? 0)
                SoapPropertyRecipeRow(name: "Bubbly", value: recipe.bubblyValue ?? 0)
                SoapPropertyRecipeRow(name: "Cleansing", value: recipe.conditionValue ?? 0)
                SoapPropertyRecipeRow(name: "Stability", value: recipe.stabilityValue ?? 0)
                SoapPropertyRecipeRow(name: "Longevity", value: recipe.longevityValue ?? 0)
                
            }
        } label: {
            HStack  {
                Text("Soap Properties")
                    .modifier(TitleModifier())
                Spacer()
            }
        }
        .groupBoxStyle(CalculatorGroupBoxStyle())
//        VStack (spacing: 12)  {
//            HStack  {
//                Text("Soap Properties")
//                    .modifier(TitleModifier())
//                Spacer()
//            }
//            VStack (spacing: 8) {
//                SoapPropertyRecipeRow(name: "Bubbly", value: recipe.bubblyValue ?? 0)
//                SoapPropertyRecipeRow(name: "Cleaning", value: recipe.conditionValue ?? 0)
//                SoapPropertyRecipeRow(name: "Condition", value: recipe.conditionValue ?? 0)
//                SoapPropertyRecipeRow(name: "Hardness", value: recipe.hardnessValue ?? 0)
//                SoapPropertyRecipeRow(name: "Longevity", value: recipe.longevityValue ?? 0)
//                SoapPropertyRecipeRow(name: "Stability", value: recipe.stabilityValue ?? 0)
//            }
//        }
    }
}

struct RecipeSoapPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSoapPropertiesView(recipe: Recipe.example())
    }
}
