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
  @State var newRecipe : Bool = false
  
  var body: some View {
    
    VStack {
      GeometryReader { geometry in
        HStack(spacing: 0) {
          Spacer()
            .frame(width: geometry.size.width / 4)
          TextField(recipe.name, text: $recipe.name)
            .font(.title)
            .frame(width: geometry.size.width / 2)
            .textSelection(.enabled)
          
          if (newRecipe) {
            Button("Save") {
             addToDataBase(recipe)
            }
          } else {
            EditView(newRecipe: $newRecipe, editMenu: $editMenu)
              .frame(width: geometry.size.width / 4)
          }
        }
      }
      .frame(height: 30)
      
      Image("photo")
        .resizable()
        .scaledToFit()
      Spacer()
        .frame(height: 20)
      
      
      
      
      
      
      ScrollView {
        
        VStack {
          HStack {
            Text("Ingredients")
              .frame(maxWidth: .infinity, alignment: .leading)
              .font(.title)
            
            
            //          EditView(newRecipe: $newRecipe, editMenu: $editMenu)
            //          Image(systemName: "pencil")
          }
          .padding(.horizontal)
        }
        
        ForEach(Array(recipe.ingredients.enumerated()), id: \.element.id) { index , ing in
         
          HStack {
              
            Text("\(ing.quantity.formatted()) \(ing.unit) of \(ing.name)")
          }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
        
        Spacer()
          .frame(height: 10)
        Text("Instructions")
          .frame(maxWidth: .infinity, alignment: .leading)
          .font(.title)
          .padding(.horizontal)
        
        ForEach(Array(recipe.instructions.enumerated()), id: \.element.self) { index, step in
          HStack {
            
            Text("Step \(index + 1):")
              .bold()
              .font(.callout)
            Text(step)
          }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
//        Text("TEST \(recipe.name)")
        
        Spacer()
      }
    }
    
//    .padding(.vertical)
  }
}




//"/Users/arshiaeslami/Documents/CookingAppSwift/CookingApp/LocalData/Recipes.json")

func addToDataBase(_ recipe : Recipe) {
  let tempDict = ["FirstName" : "Arshia", "LastName" : "Eslami", "anotherItem": "test"]
  let encoder = JSONEncoder()
  do {
    let encoded = try encoder.encode(tempDict)
    let baseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    print(baseURL.absoluteString)
   
    let fileURL = URL(
      filePath: "/Users/arshiaeslami/Documents/CookingAppSwift/CookingApp/LocalData/Recipes.json")
  
    try encoded.write(to: fileURL)
  } catch {
    print("ENCODING DIDN'T WORK")
  }
  
  
  
}



struct EditView : View {
  @Binding var newRecipe : Bool
  @Binding var editMenu : Bool
  var body: some View {
    
    ZStack {
      Menu {

        NavigationLink("Add new Recipe", destination:
                        RecipeView(recipe: Recipe(), newRecipe: true))
        .onTapGesture {
          newRecipe = true
        }
        Button("Change Recipe") {

        }
      } label: {

        Image(systemName: "square.and.pencil")

          .padding(.trailing)
//                        .frame(width: geometry.size.width / 4)
          .onTapGesture {
            editMenu.toggle()
          }
          .foregroundColor(.blue)
      }
    }

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
