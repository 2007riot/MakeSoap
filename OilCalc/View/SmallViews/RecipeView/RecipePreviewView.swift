//
//  RecipePreviewView.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 17/05/22.
//

import SwiftUI

struct RecipePreviewView: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .fill()
                .foregroundColor(.accentColor)
            HStack {
            Text(recipe.title)
                Spacer()
            }
            
        }
        
    }
}


