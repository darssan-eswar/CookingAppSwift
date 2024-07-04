//
//  DayInfo.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/2/24.
//

import Foundation

import SwiftUI

class DayInfo: Identifiable, ObservableObject {
 
  // Needs to be changed to actual date
  @Published var weekDay : String
  // Should make a food interface so I can store all of them in the meals
  @Published var meals : [Meal] = []
  @Published var breakFast : Recipe
  @Published var lunch : Recipe
  @Published var dinner : Recipe
  @Published var others : NonRecipeFood
  @Published var pieChartData : [PieSlice] = []
  @Published var date : Date = Date()
  
  init() {
    self.breakFast = Recipe()
    self.lunch = Recipe()
    self.dinner = Recipe()
    self.others = NonRecipeFood()
    self.weekDay = "Monday"
    meals.append(Meal.of("BreakFast", breakFast))
    meals.append(Meal.of("Lunch", lunch))
    meals.append(Meal.of("Dinner", dinner))
    pieChartData = [
    PieSlice(category: "Fats", value: 20, color: colorTheme.c1),
    PieSlice(category: "Carbs", value: 20, color: colorTheme.c2),
    PieSlice(category: "Protein", value: 20, color: colorTheme.c3)
    ]
  }
  
  func setBreakFast(breakFast: Recipe) -> DayInfo {
    self.breakFast = breakFast
    self.meals[0].recipe = breakFast
    
    return updateNutrition()
  }
  
  func setLunch(lunch: Recipe) -> DayInfo {
    self.lunch = lunch
    
    self.meals[1].recipe = lunch
    
    return updateNutrition()
  }
  
  func setDinner(dinner: Recipe) -> DayInfo {
    self.dinner = dinner
    
    self.meals[2].recipe = dinner
    return updateNutrition()
  }
  
  func setOthers(others : NonRecipeFood) -> DayInfo {
    self.others = others
    return self
  }
  
  func setDate(date : Date) -> DayInfo {
    self.date = date
    let dateFormatter = DateFormatter()
    // Format to show the weekdays, e.g Monday
    dateFormatter.dateFormat = "EEEE"
    self.weekDay = dateFormatter.string(from: date)
    return self
  }
  
  func setRatioOneValue(value: Double) -> DayInfo{
    pieChartData[0].value = value
    return self
  }
    
  func updateNutrition() -> DayInfo {
    for meal in meals {
      var fats : Double = 0
      var carbs : Double = 0
      var protein : Double = 0
      fats += meal.recipe.nutInfo.fats
      carbs += meal.recipe.nutInfo.carbs
      protein += meal.recipe.nutInfo.protien
      
      pieChartData = [
      PieSlice(category: "Fats", value: fats, color: colorTheme.c1),
      PieSlice(category: "Carbs", value: carbs, color: colorTheme.c2),
      PieSlice(category: "Protein", value: protein, color: colorTheme.c3)
      ]
    }
    
    return self
  }
  
}

struct PieSlice: Identifiable {
    let id = UUID()
    let category: String
    var value: Double
    let color: Color
}

