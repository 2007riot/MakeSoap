//
//  ContentView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var recipeManager = RecipeManager()
    
    var body: some View {
        
            TabView {
                CalculatorScreen()
                    .tabItem {
                        Label("Calculator", systemImage: "percent")
                    }
                    .environmentObject(recipeManager)
                RecipesListView()
                    .tabItem {
                        Label("Recipies", systemImage: "archivebox.fill") // archivebox.circle.fill // wand.and.rays.inverse //circle.grid.cross //circle.grid.cross.fill //rectangle.roundedtop.fill //rectangle.roundedbottom.fill //light.min
                    }
                    .environmentObject(recipeManager)
                    
            }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
