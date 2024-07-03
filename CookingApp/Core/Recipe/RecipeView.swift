//
//  RecipeView.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/26/24.
//

import Foundation
import SwiftUI



struct RecipeView: View {
  @State private var recipe: Recipe = dummyData.Recipes[1]
  
  var body: some View {
    VStack {
      Image("photo")
        .resizable()
        .scaledToFit()
      ToggleViewIngredient(recipe.ingredients)
      ToggleViewInstruction(recipe.instructions)
      Spacer()
    }
    .padding(.vertical)
  }
}


struct ToggleViewIngredient: View {
  let title: String = "Ingredients"
  let ingredients:[Ingredient]
  @State var isExpanded: Bool = false
  
  init(_ ingredients: [Ingredient]) {
    self.ingredients = ingredients
  }
  
  var body: some View {
    VStack(alignment:.leading){
      HStack {
        Text(title)
        Spacer()
        Image(systemName: "chevron.down")
          .rotationEffect(.degrees(isExpanded ? -180 : 0))
      }
      .padding(.horizontal)
      .frame(height: 40)
      .onTapGesture {
        withAnimation(.snappy) {
          isExpanded.toggle()
        }
      }
      if isExpanded {
        VStack(alignment:.leading){
          ForEach(ingredients, id: \.id) { ing in
            HStack {
              Text("\(ing.quantity.format()) \(ing.unit) of \(ing.name)")
            }
          }
        } .padding(.horizontal)
      }
    }
    .padding(.horizontal)
  }
}


struct ToggleViewInstruction: View {
  let title: String = "Instructions"
  @State var instructions: [String]
  @State var isExpanded: Bool = false
  
  init(_ instructions: [String]) {
    self.instructions = instructions
  }
  
  var body: some View {
    VStack{
      HStack {
        Text(title)
        Spacer()
        Image(systemName: "chevron.down")
          .rotationEffect(.degrees(isExpanded ? -180 : 0))
      }
      .padding(.horizontal)
      .frame(height: 40)
      .onTapGesture {
        withAnimation(.snappy) {
          isExpanded.toggle()
        }
      }
      if isExpanded {
        VStack(alignment: .leading){
          ForEach(instructions, id: \.self) { ins in
            HStack{
              Text("\(ins)")
            }
          }
        }.padding(.horizontal)
      }
    } .padding(.horizontal)
  }
}

#Preview{
    RecipeView()
}
