//
//  RecipeScreen.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct RecipesView: View {
    @ObservedObject var recipeManager = RecipeManager.shared
    var body: some View {
        NavigationView {
            ScrollView {
        VStack {
            ForEach(recipeManager.recipes) { recipe in
                NavigationLink {
                    RecipeDetailView(recipe: recipe)
                } label: {
                    RecipePreviewView(recipe: recipe).frame(width: 160, height: 200, alignment: .leading)
                }
                .navigationTitle("Recipes")
                
                
            }
        }
        }
        }
    }
}

struct RecipeScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
