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
                //CalculatedOilRow(oil: o, unit: recipe.unit)
                
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
        .navigationBarTitle(recipe.title, displayMode: .inline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.example())
    }
}
