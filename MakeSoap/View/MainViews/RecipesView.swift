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
           
                List {
                    ForEach(recipeManager.recipes) { r in
                        NavigationLink {
                            RecipeDetailView(recipe: r)
                        } label: {
                            VStack (alignment: .leading) {
                                Text(r.title)
                                    .modifier(TitleModifier())
                                Text(r.date, format: .dateTime.day().month().year().hour().minute().second())
                            }
                        }
                        
                        
                        
                    }
                    .onDelete(perform: recipeManager.delete(_:))
                }
        
        
            .navigationTitle("Recipes")
//            .toolbar {
//                ToolbarItem (placement: .navigationBarTrailing){
//                    <#code#>
//                }
//            }
        }
    }
}

struct RecipeScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
