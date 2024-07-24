//
//  Ingredient.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Ingredient: Codable, Identifiable {
  public let id: String
  var name: String
  var unit: String
  var quantity: String
 
  
  init(theName name: String, theUnit unit: String, theQuantity quantity: String) {
    self.name = name
    self.unit = unit
    self.quantity = quantity
    self.id = UUID().uuidString
  }
  
  init() {
    self.init(theName: "ing", theUnit: "cups", theQuantity: "2")
  }
}
