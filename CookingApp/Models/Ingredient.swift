//
//  Ingredient.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Ingredient: Codable, Identifiable {
  public let id: String
  let name: String
  let unit: String
  let quantity: Double
 
  
  init(theName name: String, theUnit unit: String, theQuantity quantity: Double) {
    self.name = name
    self.unit = unit
    self.quantity = quantity
    self.id = UUID().uuidString
  }
  
  init() {
    self.init(theName: "ing", theUnit: "cups", theQuantity: 3)
  }
}
