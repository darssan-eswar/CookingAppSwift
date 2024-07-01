//
//  Recipe.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Recipe: Codable, Identifiable{
  
  public let id: String
  let name: String
  let description: String
  let ingredients: [Ingredient]
  let instructions: [String]
 
  init() {
    
    self.id =  UUID().uuidString
    self.name = "DefaultRecipeName"
    self.description = "This is the default description for the recipe"
    self.ingredients = [Ingredient(), Ingredient()]
    self.instructions = ["first step", "second step"]
  }
 
  init(theId id : String, theName name:String, theDescription description:String, theIngredients ingredients :[Ingredient], theInstructions instructions: [String]) {
    
    self.id =  id
    self.name = name
    self.description = description
    self.ingredients = ingredients
    self.instructions = instructions
  }
  
  static func of(_ name: String, _ description: String, _ ingredients: [Ingredient], _ instructions: [String]) -> Recipe {
    return Recipe(
      theId: UUID().uuidString,
      theName: name,
      theDescription: description,
      theIngredients: ingredients,
      theInstructions: instructions
    )
  }
}

