//
//  Recipe.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
  let id: String
  let name: String
  let description: String
  let ingredients: [Ingredient]
  
  static func of(_ name: String, _ description: String, _ ingredients: [Ingredient]) -> Recipe {
    return Recipe(
      id: UUID().uuidString,
      name: name,
      description: description,
      ingredients: ingredients
    )
  }
}
