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
            if let soapType = recipe.soapType, let soapMakingProcess = recipe.soapMakingProcess {
                VStack {
                    Text("\(soapType), \(soapMakingProcess)")
                    Text("from \(recipe.date, format: .dateTime.day().month().year())")
                    
                }
            }
            
            RecipeSoapIngredientsView(recipe: recipe)
                .padding()
            
            RecipeSoapPropertiesView(recipe: recipe)
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

