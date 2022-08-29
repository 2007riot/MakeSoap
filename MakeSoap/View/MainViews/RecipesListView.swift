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
            
            Group {
            if recipeManager.recipes.isEmpty {
                
                VStack (alignment: .center, spacing: 20) {
                
                Text("You have no recipes yet! Start by calculating a new soap recipe.")
                        .padding()
                Text("🧼🧼🧼")
                        .font(.system(size: 60))
                }
            } else {
                List {
                    ForEach(recipeManager.recipes) { r in
                        NavigationLink {
                            RecipeDetailView(recipe: r)
                        } label: {
                            VStack (alignment: .leading) {
                                Text(r.title)
                                    .modifier(Title2Modifier())
                                Text(r.date, format: .dateTime.day().month().year())
                                    .font(.footnote)
                            }
                        }
                        
                    }
                    .onDelete(perform: recipeManager.delete(_:))
                }
                
            }
            }
                .navigationTitle("Recipes")
                .navigationViewStyle(.columns)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
            
        }
        .navigationViewStyle(.stack)
    }
}

struct RecipesListView_Previews: PreviewProvider {
    
    static let recipeManager = RecipeManager()
    
    static var previews: some View {
        RecipesListView()
            .environmentObject(recipeManager)
    }
}
