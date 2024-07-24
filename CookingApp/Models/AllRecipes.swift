//
//  RecipeInfo.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/23/24.
//

import Foundation


class RecipeInfo : ObservableObject {
 
  @Published var recipes : [Recipe]
  

  init () {
    self.recipes = templateData().allRecipes
  }
  
  init(recipes : [Recipe]) {
    self.recipes = recipes
  }
}
