//
//  RecipeView.swift
//  CookingApp
//
//  Created by Arshia Eslami on 6/26/24.
//

import Foundation
import SwiftUI



struct RecipeView: View {
  // The recipe we are showing
  @State var recipe : Recipe
  // true if we are editing current Recipe
  @State var editRecipe : Bool = false
  // true if we are creating new Recipe
  @State var newRecipe : Bool = false
  // true if we are changing the recipe to a new one
  @State var changeRecipe : Bool = false
  
  @State var ingPopover : Bool = false
  @EnvironmentObject var allRecipes : AllRecipes
  
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
            .disabled(!(editRecipe || newRecipe))
          if (newRecipe) {
            Button("Save") {
              allRecipes.recipes.append(recipe)
              newRecipe = false
            }
          } else {
            EditView(newRecipe: $newRecipe, editMenu: $editRecipe)
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
          }
          .padding(.horizontal)
        }
        
        ForEach(Array($recipe.ingredients.enumerated()), id: \.element.id) { index , $ing in
        
          IngredientView(ing: $ing, enable: (editRecipe || newRecipe), ingPopover: $ingPopover)
          
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
       
        if (editRecipe || newRecipe) {
          
        }
        
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
        
        Spacer()
      }
    }
    
    .popover(isPresented: $ingPopover, content: {
//      RecipeSearchView(recipe, currRecipe: )
      Text("TEMP")
        .presentationDetents([.medium])
    })
  }
}


struct IngredientView : View {
  @Binding var ing : Ingredient
  var enable : Bool = false
  @State var unit : String = ""
  @State var quantity : String = ""
  @Binding var ingPopover : Bool
  
  var body: some View {
    
    
    
    HStack {
      Rectangle()
        .fill(.gray)
        .frame(width: 40, height: 30)
        .cornerRadius(20)
        .overlay {
          TextField("\(ing.quantity)", text: $ing.quantity)
        }
      
      Rectangle()
        .fill(.gray)
        .frame(width: 100, height: 30)
        .cornerRadius(20)
        .overlay {
          TextField("Unit", text : $ing.unit)
            .disabled(!enable)
        }
      
      Rectangle()
        .fill(.white)
        .frame(width: 20, height: 30)
        .cornerRadius(20)
        .overlay {
          Text("of")
        }
      
      Rectangle()
        .fill(.gray)
        .frame(width: 170, height: 30)
        .cornerRadius(20)
        .overlay  {
          Button (ing.name) {
              ingPopover = true
          }
          .foregroundStyle(.black)
        }
    
        
        
//        Menu ("\(ing.name)"){
//            ForEach(0..<20) { index in
//              
//              Text("item 1")
//            }
//          
        
//        .foregroundStyle(.black)
    }


  }
}




func addToDataBase(_ recipe : Recipe) {
  
 
  
}



struct EditView : View {
  @Binding var newRecipe : Bool
  @Binding var editMenu : Bool
  var body: some View {
    
    ZStack {
      Menu {

        NavigationLink("Create new Recipe", destination:
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
