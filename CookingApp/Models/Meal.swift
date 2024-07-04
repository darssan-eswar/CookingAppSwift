//
//  Meal.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/28/24.
//

import Foundation

import SwiftUI

class Meal: Identifiable, ObservableObject{

  @Published var id: String
  // Title like breakfast, lunch or snack
  @Published public var title: String
  @Published var recipe: Recipe

  


  init(id: String, title: String, recipe: Recipe) {
    self.id = id
    self.title = title
    self.recipe = recipe
  }

  func setTitle(_ title: String) {
    self.title = title
  }
 
  
  static func of(_ title: String, _ recipe: Recipe) -> Meal{
    return Meal(id: UUID().uuidString, title: title, recipe: recipe)
  }
  
}


