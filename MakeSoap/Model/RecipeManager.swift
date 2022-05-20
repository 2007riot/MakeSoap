//
//  RecipeManager.swift
//  Make Soap
//
//  Created by Galina Aleksandrova on 17/05/22.
//

import Foundation

class RecipeManager: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    private let dataSourceURL: URL
    static let shared = RecipeManager()
    
    private func getAllRecipes() -> [Recipe] {
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: dataSourceURL)
            let decodedRecipes = try! decoder.decode([Recipe].self, from: data)
                
            return decodedRecipes
        } catch {
            return []
        }
    }
    
    
    private func saveRecipes() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(recipes)
            try data.write(to: dataSourceURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func create(recipe: Recipe) {
        recipes.insert(recipe, at: 0)
        saveRecipes()
    }
    
    func delete(_ offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
        saveRecipes()
    }
    
    func delete(recipe: Recipe) {
        //need to think about it
    }
    
    
    init() {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let recipesPath = documentsPath.appendingPathComponent("recipes").appendingPathExtension("json")
        dataSourceURL = recipesPath
           
        _recipes = Published(wrappedValue: getAllRecipes())
    }
}
