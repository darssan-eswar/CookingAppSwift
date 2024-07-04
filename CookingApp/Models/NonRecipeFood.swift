//
//  NonRecipeFood.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/2/24.
//

import Foundation



struct NonRecipeFood {

  let name : String
  let description : String?
  let nutritionalInfo : NutritionalValue
  
  init(name : String, description : String) {
    self.name = name
    self.description = description
    self.nutritionalInfo = NutritionalValue()
  }
  
  init() {
    self.name = "Default Non Recipe Food"
    self.description = "" 
    self.nutritionalInfo = NutritionalValue()
  }
}
