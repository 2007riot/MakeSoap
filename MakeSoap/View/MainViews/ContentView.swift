//
//  ContentView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI
import PartialSheet

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
                        Label("Recipes", systemImage: "archivebox.fill") // archivebox.circle.fill // wand.and.rays.inverse //circle.grid.cross //circle.grid.cross.fill //rectangle.roundedtop.fill //rectangle.roundedbottom.fill //light.min
                    }
                    .environmentObject(recipeManager)
                    
            }
            .attachPartialSheetToRoot()
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
