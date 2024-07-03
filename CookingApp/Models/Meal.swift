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

  
  var pieChartData = [
    PieSlice(category: "Fats", value: 30, color: colorTheme.c1),
    PieSlice(category: "Carbs", value: 20, color: colorTheme.c2),
    PieSlice(category: "Protein", value: 20, color: colorTheme.c3)
    ]

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
  
  func setRatioOneValue(value: Double) -> Meal{
    pieChartData[0].value = value
    return self
  }
}


struct PieSlice: Identifiable {
    let id = UUID()
    let category: String
    var value: Double
    let color: Color
}
