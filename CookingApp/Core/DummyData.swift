//
//  DummyData.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/28/24.
//

import Foundation


struct dummyData : Identifiable{
  var id: ObjectIdentifier
  
  public static let Meals:[Meal] = [
  
    Meal.of(
    "Pizza",
    Recipes[0]
    ).setRatioOneValue(value: 40.0),
    
    Meal.of(
    "Egg Roll",
    Recipes[1]
    ).setRatioOneValue(value: 55.5)
  ]
  
  let Ingredients: [Ingredient] = [
    Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
    Ingredient(theName: "Sugar", theUnit: "cups", theQuantity: 1.5),
    Ingredient(theName: "Butter", theUnit: "tablespoons", theQuantity: 4.0),
    Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 3.0)
  ]
  
  public static let Recipes: [Recipe] = [
    Recipe.of(
      "Pancakes",
      "Fluffy and delicious pancakes.",
      [
        Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
        Ingredient(theName: "Milk", theUnit: "cups", theQuantity: 1.5),
        Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 2.0),
        Ingredient(theName: "Baking Powder", theUnit: "teaspoons", theQuantity: 1.0),
        Ingredient(theName: "Salt", theUnit: "teaspoons", theQuantity: 0.5),
        Ingredient(theName: "Butter", theUnit: "tablespoons", theQuantity: 2.0)
      ],
      ["step 1", "step 2"]
    ),
    Recipe.of(
      "Chocolate Cake",
      "Rich and moist chocolate cake.",
      [
        Ingredient(theName: "Flour", theUnit: "cups", theQuantity: 2.0),
        Ingredient(theName: "Cocoa Powder", theUnit: "cups", theQuantity: 0.75),
        Ingredient(theName: "Baking Powder", theUnit: "teaspoons", theQuantity: 1.5),
        Ingredient(theName: "Baking Soda", theUnit: "teaspoons", theQuantity: 1.5),
        Ingredient(theName: "Salt", theUnit: "teaspoons", theQuantity: 1.0),
        Ingredient(theName: "Butter", theUnit: "cups", theQuantity: 0.5),
        Ingredient(theName: "Sugar", theUnit: "cups", theQuantity: 2.0),
        Ingredient(theName: "Eggs", theUnit: "pieces", theQuantity: 2.0),
        Ingredient(theName: "Vanilla Extract", theUnit: "teaspoons", theQuantity: 2.0),
        Ingredient(theName: "Milk", theUnit: "cups", theQuantity: 1.0)
      ], 
      [
          "1. In a large bowl, whisk together 1 cup of flour, 2 tablespoons of sugar, 1 tablespoon of baking powder, and a pinch of salt.",
          "2. In a separate bowl, beat 1 egg and then whisk in 1 cup of milk and 2 tablespoons of melted butter.",
          "3. Pour the wet ingredients into the dry ingredients and stir until just combined. Be careful not to overmix; the batter should be slightly lumpy.",
          "4. Heat a non-stick skillet or griddle over medium heat and lightly grease it with butter or oil.",
          "5. Pour 1/4 cup of batter onto the skillet for each pancake.",
          "6. Cook until bubbles form on the surface of the pancakes and the edges look set, about 2-3 minutes.",
          "7. Flip the pancakes and cook until the other side is golden brown, about 1-2 minutes more.",
          "8. Remove the pancakes from the skillet and keep them warm while you cook the remaining batter.",
          "9. Serve the pancakes warm with butter, syrup, and your favorite toppings."
          ]
    )
  ]
}
