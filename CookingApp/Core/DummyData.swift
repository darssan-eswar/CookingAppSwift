//
//  DummyData.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/28/24.
//

import Foundation



struct templateData: Identifiable {
  let id : String = UUID().uuidString
  let scrambledEggs = Recipe.of(
      "Scrambled Eggs",
      "Delicious scrambled eggs",
      [Ingredient(theName: "Eggs", theUnit: "pcs", theQuantity: 3)],
      ["Whisk eggs, season, cook over medium heat"]
  )

  let chickenSandwich = Recipe.of(
      "Chicken Sandwich",
      "Tasty chicken sandwich",
      [
          Ingredient(theName: "Chicken breast", theUnit: "pcs", theQuantity: 1),
          Ingredient(theName: "Bread", theUnit: "slices", theQuantity: 2)
      ],
      ["Grill chicken, assemble with bread and vegetables"]
  )

  let grilledSalmon = Recipe.of(
      "Grilled Salmon",
      "Healthy grilled salmon",
      [
          Ingredient(theName: "Salmon fillet", theUnit: "pcs", theQuantity: 1),
          Ingredient(theName: "Olive oil", theUnit: "tbsp", theQuantity: 1)
      ],
      ["Season salmon, grill until cooked through"]
  )

  let salad = NonRecipeFood(name: "Salad", description: "Fresh garden salad")
  let pancakes = Recipe.of(
      "Pancakes",
      "Fluffy pancakes",
      [
          Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 1),
          Ingredient(theName: "Eggs", theUnit: "pcs", theQuantity: 2)
      ],
      ["Mix ingredients, cook until golden brown"]
  )

  let caesarSalad = Recipe.of(
      "Caesar Salad",
      "Classic Caesar salad",
      [
          Ingredient(theName: "Romaine lettuce", theUnit: "cups", theQuantity: 2),
          Ingredient(theName: "Chicken breast", theUnit: "pcs", theQuantity: 1)
      ],
      ["Chop lettuce, grill chicken, toss with dressing"]
  )

  let beefStirFry = Recipe.of(
      "Beef Stir Fry",
      "Quick beef stir fry",
      [
          Ingredient(theName: "Beef strips", theUnit: "grams", theQuantity: 200),
          Ingredient(theName: "Bell peppers", theUnit: "pcs", theQuantity: 2)
      ],
      ["Sear beef, stir fry with vegetables and sauce"]
  )

  let fruitPlatter = NonRecipeFood(name: "Fruit Platter", description: "Assorted fresh fruits")

  let smoothie = Recipe.of(
      "Smoothie",
      "Refreshing fruit smoothie",
      [
          Ingredient(theName: "Banana", theUnit: "pcs", theQuantity: 1),
          Ingredient(theName: "Berries", theUnit: "cups", theQuantity: 1)
      ],
      ["Blend fruits with yogurt until smooth"]
  )

  let quinoaSalad = Recipe.of(
      "Quinoa Salad",
      "Healthy quinoa salad",
      [
          Ingredient(theName: "Quinoa", theUnit: "cups", theQuantity: 1),
          Ingredient(theName: "Tomatoes", theUnit: "pcs", theQuantity: 2)
      ],
      ["Cook quinoa, mix with vegetables and dressing"]
  )

  let vegetarianPizza = Recipe.of(
      "Vegetarian Pizza",
      "Delicious veggie pizza",
      [
          Ingredient(theName: "Pizza dough", theUnit: "pcs", theQuantity: 1),
          Ingredient(theName: "Cheese", theUnit: "cups", theQuantity: 1)
      ],
      ["Roll out dough, top with vegetables and cheese, bake"]
  )

  let yogurt = NonRecipeFood(name: "Yogurt", description: "Greek yogurt")

  let avocadoToast = Recipe.of(
      "Avocado Toast",
      "Healthy avocado toast",
      [
          Ingredient(theName: "Avocado", theUnit: "pcs", theQuantity: 1),
          Ingredient(theName: "Bread", theUnit: "slices", theQuantity: 1)
      ],
      ["Toast bread, spread avocado on top"]
  )

  let sushi = Recipe.of(
      "Sushi",
      "Fresh sushi rolls",
      [
          Ingredient(theName: "Sushi rice", theUnit: "cups", theQuantity: 1),
          Ingredient(theName: "Salmon", theUnit: "pcs", theQuantity: 2)
      ],
      ["Cook rice, roll with salmon and nori"]
  )

  let chickenCurry = Recipe.of(
      "Chicken Curry",
      "Spicy chicken curry",
      [
          Ingredient(theName: "Chicken thighs", theUnit: "pcs", theQuantity: 2),
          Ingredient(theName: "Curry paste", theUnit: "tbsp", theQuantity: 2)
      ],
      ["Cook chicken with curry paste until tender"]
  )

  let nuts = NonRecipeFood(name: "Nuts", description: "Assorted nuts")

  public var days : [DayInfo] = []
  
  init() {
   
    let calendar = Calendar.current
    let currDate = Date()
    
    let day2 = DayInfo()
      .setBreakFast(breakFast: pancakes)
      .setLunch(lunch: caesarSalad)
      .setDinner(dinner: beefStirFry)
      .setOthers(others: fruitPlatter)
      .setDate(date: currDate)
    days.append(day2)

    let day3 = DayInfo()
        .setBreakFast(breakFast: smoothie)
        .setLunch(lunch: quinoaSalad)
        .setDinner(dinner: vegetarianPizza)
        .setOthers(others: yogurt)
        .setDate(date: calendar.date(byAdding: .day, value: 1, to: currDate) ?? Date())
    days.append(day3)

    let day4 = DayInfo()
        .setBreakFast(breakFast: avocadoToast)
        .setLunch(lunch: sushi)
        .setDinner(dinner: chickenCurry)
        .setOthers(others: nuts) 
        .setDate(date: calendar.date(byAdding: .day, value: 2, to: currDate) ?? Date())
    days.append(day4)
    
    let day5 = DayInfo()
      .setDate(date: calendar.date(byAdding: .day, value: 3, to: currDate) ?? Date())
    days.append(day5)
  }
  
}









//struct dummyData : Identifiable{
//  var id: ObjectIdentifier
//  
//  public static let Meals:[Meal] = [
//  
//    Meal.of(
//    "Pizza",
//    Recipes[0]
//    ).setRatioOneValue(value: 40.0),
//    
//    Meal.of(
//    "Egg Roll",
//    Recipes[1]
//    ).setRatioOneValue(value: 55.5)
//  ]
//  
//  let Ingredients: [Ingredient] = [
//    Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
//    Ingredient(theName: "Sugar", theUnit: "cups", theQuantity: 1.5),
//    Ingredient(theName: "Butter", theUnit: "tablespoons", theQuantity: 4.0),
//    Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 3.0)
//  ]
//  
//  public static let Recipes: [Recipe] = [
//    Recipe.of(
//      "Pancakes",
//      "Fluffy and delicious pancakes.",
//      [
//        Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
//        Ingredient(theName: "Milk", theUnit: "cups", theQuantity: 1.5),
//        Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 2.0),
//        Ingredient(theName: "Baking Powder", theUnit: "teaspoons", theQuantity: 1.0),
//        Ingredient(theName: "Salt", theUnit: "teaspoons", theQuantity: 0.5),
//        Ingredient(theName: "Butter", theUnit: "tablespoons", theQuantity: 2.0)
//      ],
//      ["step 1", "step 2"]
//    ),
//    Recipe.of(
//      "Chocolate Cake",
//      "Rich and moist chocolate cake.",
//      [
//        Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
//        Ingredient(theName: "Cocoa Powder", theUnit: "cups", theQuantity: 0.75),
//        Ingredient(theName: "Baking Powder", theUnit: "teaspoons", theQuantity: 1.5),
//        Ingredient(theName: "Baking Soda", theUnit: "teaspoons", theQuantity: 1.5),
//        Ingredient(theName: "Salt", theUnit: "teaspoons", theQuantity: 1.0),
//        Ingredient(theName: "Butter", theUnit: "cups", theQuantity: 0.5),
//        Ingredient(theName: "Sugar", theUnit: "cups", theQuantity: 2.0),
//        Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 2.0),
//        Ingredient(theName: "Vanilla Extract", theUnit: "teaspoons", theQuantity: 2.0),
//        Ingredient(theName: "Milk", theUnit: "cups", theQuantity: 1.0)
//      ], 
//      [
//          "1. In a large bowl, whisk together 1 cup of flour, 2 tablespoons of sugar, 1 tablespoon of baking powder, and a pinch of salt.",
//          "2. In a separate bowl, beat 1 egg and then whisk in 1 cup of milk and 2 tablespoons of melted butter.",
//          "3. Pour the wet ingredients into the dry ingredients and stir until just combined. Be careful not to overmix; the batter should be slightly lumpy.",
//          "4. Heat a non-stick skillet or griddle over medium heat and lightly grease it with butter or oil.",
//          "5. Pour 1/4 cup of batter onto the skillet for each pancake.",
//          "6. Cook until bubbles form on the surface of the pancakes and the edges look set, about 2-3 minutes.",
//          "7. Flip the pancakes and cook until the other side is golden brown, about 1-2 minutes more.",
//          "8. Remove the pancakes from the skillet and keep them warm while you cook the remaining batter.",
//          "9. Serve the pancakes warm with butter, syrup, and your favorite toppings."
//          ]
//    )
//  ]
//}
