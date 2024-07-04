//
//  RecipeView.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/26/24.
//

import Foundation
import SwiftUI



struct RecipeView: View {
  @State var recipe : Recipe
  @State var editMenu : Bool = false
  
  var body: some View {
      VStack {
      
        GeometryReader { geometry in
          HStack(spacing: 0) {
            Spacer()
              .frame(width: geometry.size.width / 4)
            Text(recipe.name)
              .font(.title)
              .frame(width: geometry.size.width / 2)
              .textSelection(.enabled)
            
            
            ZStack {
              Menu {
                Button("Edit Recipe") {
                  
                }
                Button("Change Recipe") {
                  
                }
              } label: {
                
                Image(systemName: "square.and.pencil")
                
                  .padding(.trailing)
                  .frame(width: geometry.size.width / 4)
                  .onTapGesture {
                    editMenu.toggle()
                  }
                  .foregroundColor(.blue)
              }
            }
          }
          .frame(height: geometry.size.height)
        }
        .frame(height: 40)
       
        Image("photo")
          .resizable()
          .scaledToFit()
        Spacer()
          .frame(height: 20)
        
        HStack {
          Text("Ingredients")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title2)
          Image(systemName: "pencil")   
        }
        .padding(.horizontal)
        
        ForEach(recipe.ingredients) { ing in
   
          Text("\(doubleFormatter(ing.quantity)) \(ing.unit) of \(ing.name)")
        }
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(.horizontal)
          
          Spacer()
          .frame(height: 10)
        Text("Instructions")
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.title2)
          .padding(.horizontal)
        
        ForEach(recipe.instructions, id: \.self) { step in
          Text(step)
        }
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding(.horizontal)

        
//        ToggleViewIngredient(recipe.ingredients)
        
//        ToggleViewInstruction(recipe.instructions)
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
        .padding(.horizontal)
        .frame(height: 40)
        .onTapGesture {
          withAnimation(.snappy) {
            isExpanded.toggle()
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
  RecipeView(recipe: templateData().days[0].lunch)
}
