//
//  Meal.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

struct Meal: Codable, Identifiable {
  let id: String
  let name: String
  let description: String
  let recipes: [String]
}
