//
//  ContentView.swift
//  OilCalc
//
//  Created by Galina Aleksandrova on 03/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //ZStack (alignment: .bottom) {
            TabView {
                CalculatorScreen()
                    .tabItem {
                        Label("Calculator", systemImage: "percent")
                    }
                RecipesView()
                    .tabItem {
                        Label("Recipies", systemImage: "archivebox.fill") // archivebox.circle.fill // wand.and.rays.inverse //circle.grid.cross //circle.grid.cross.fill //rectangle.roundedtop.fill //rectangle.roundedbottom.fill //light.min
                    }
            }
            
        //}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
