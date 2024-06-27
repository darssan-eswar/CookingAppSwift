//
//  Ingredient.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Ingredient: Codable, Identifiable {
  let id: String
  let name: String
  let unit: String
  let pricePerUnit: Double
}
