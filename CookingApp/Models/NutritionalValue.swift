//
//  NutritionalValue.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/2/24.
//

import Foundation


struct NutritionalValue {
 
  var calories : Double
  var fats : Double
  var carbs : Double
  var protien : Double
  
  
  init() {
    self.calories = Double.random(in: 100...500)
    self.carbs = Double.random(in: 10...30)
    self.fats = Double.random(in: 10...30)
    self.protien = Double.random(in: 10...30)
  }
  
  init(calories : Double, fats : Double, carbs : Double, protein : Double) {
    self.calories = calories
    self.fats = fats
    self.carbs = carbs
    self.protien = protein
  }
}
