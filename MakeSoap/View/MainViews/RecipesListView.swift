//
//  RecipeScreen.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var recipeManager: RecipeManager
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
            .navigationViewStyle(.columns)
            
        }
        .navigationViewStyle(.stack)
    }
}

//struct RecipeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipesView(recipeManager: <#RecipeManager#>)
//    }
//}
