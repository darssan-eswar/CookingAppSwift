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
//  @Binding var recipe : Recipe
  
  // true if we are editing current Recipe
  @State var editRecipe : Bool = false
  // true if we are creating new Recipe
  @State var newRecipe : Bool = false
  // true if we are changing the recipe to a new one
  @State var changeRecipe : Bool = false
  
  @State var ingPopover : Bool = false
  
  @Binding var hitSaved : Bool
  
  @State var ingDeleted : Bool = false
  
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
          if (newRecipe || editRecipe) {
            Button("Save") {
              //TODO: Needs replacement to the actual database
              if (newRecipe) {
                
                allRecipes.recipes.append(recipe)
                newRecipe = false
              }
              if (editRecipe) {
                allRecipes.recipes.removeAll {
                  $0.name == recipe.name
                }
                
                
                editRecipe = false
              }
                // ??
              hitSaved = false
            }
            .foregroundStyle(.green)
            .frame(width: geometry.size.width / 4)
          } else {
            Button (action: {
              editRecipe = true
            }, label: {
              Text("Edit")
            })
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
          
          IngredientView(recipe: $recipe, ingPopover: $ingPopover, editing: $editRecipe)
          
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
          if (editRecipe || newRecipe) {
            Button(action: {
              recipe.ingredients.append(Ingredient())
            }, label: {
              HStack {
                RoundedRectangle(cornerRadius: 20)
                  .fill(.green)
                  .frame(width: 350, height: 30)
                  .overlay {
                    Image(systemName: "plus")
                }
              }
            })
          }
          
          HStack {
            
            Text("Instructions")
              .frame(alignment: .leading)
              .font(.title)
          }
          .frame(maxWidth:.infinity, alignment: .leading)
          InstructionView(recipe: $recipe, editing: $editRecipe)
          
          if (editRecipe || newRecipe) {
            Button(action: {
              recipe.instructions.append("")
            }, label: {
              HStack {
                RoundedRectangle(cornerRadius: 20)
                  .fill(.green)
                  .frame(width: 350, height: 30)
                  .overlay {
                    Image(systemName: "plus")
                }
              }
            })
          }
//          Spacer()
        }
        .padding(.horizontal)
        .popover(isPresented: $ingPopover, content: {
          //      RecipeSearchView(recipe, currRecipe: )
          Text("TEMP")
            .presentationDetents([.medium])
        })
      }
    }
  }
}


struct InstructionView : View {
  @Binding var recipe : Recipe
  @Binding var editing : Bool
  @State var currStep : String = ""
  
  var body: some View {
    
    ForEach(Array($recipe.instructions.enumerated()), id: \.offset) { index, $step in
      HStack {
        
        Text("\(index + 1):")
          .bold()
          .font(.callout)
        TextField(recipe.instructions[index], text: $step, axis: .vertical)
          .disabled(!editing)
      
      if (editing) {
        Button(action: {
          recipe.instructions.remove(at: index)
        }, label: {
          Image(systemName: "trash")
            .foregroundStyle(.red)
        })
      }
    }
      }
      .frame(maxWidth: .infinity,alignment: .leading)
  }
}




struct IngredientView : View {
  @Binding var recipe : Recipe
  @State var unit : String = ""
  @State var quantity : String = ""
  @Binding var ingPopover : Bool
  @Binding var editing : Bool
  var body: some View {
    
    
    
    ForEach(Array($recipe.ingredients.enumerated()), id: \.element.id) { index , $ing in
      HStack {
        Rectangle()
          .fill(.gray)
          .frame(width: 30, height: 30)
          .cornerRadius(20)
          .overlay(alignment : .center) {
            TextField("\(ing.quantity)", text: $ing.quantity)
              .disabled(!editing)
              .multilineTextAlignment(.center)
              
          }
        
        
        Rectangle()
          .fill(.gray)
          .frame(width: 80, height: 30)
          .cornerRadius(20)
          .overlay {
            TextField("Unit", text : $ing.unit)
              .disabled(!editing)
              .multilineTextAlignment(.center)
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
          .frame(width: 140, height: 30)
          .cornerRadius(20)
          .overlay  {
            Button (ing.name) {
              ingPopover = true
            }
            .foregroundStyle(.black)
          }
        if (editing) {
          Button(action: {
            recipe.ingredients.remove(at: index)
          }, label: {
            Image(systemName: "trash")
              .foregroundStyle(.red)
          })
        }
      }
      .padding(.vertical, 2)
    }

  }
}



//struct EditView : View {
//  @Binding var newRecipe : Bool
//  @Binding var editMenu : Bool
//  var body: some View {
   
    
//    NavigationLink("Create new Recipe", destination:
//                    RecipeView(recipe: Recipe(), newRecipe: true, hitSaved: .constant(false)))
//    Button (action: {
//     editMenu = true
//    }, label: {
//      Text("edit")
//    })
//      
//    
//    .onTapGesture {
////      newRecipe = true
//      editMenu = true
//    }
    
//    ZStack {
//      Menu {
//
//        NavigationLink("Create new Recipe", destination:
//                        RecipeView(recipe: Recipe(), newRecipe: true, hitSaved: .constant(false)))
//        .onTapGesture {
//          newRecipe = true
//        }
//        Button("Change Recipe") {
//          editMenu = true
//        }
//      } label: {
//
//        Image(systemName: "square.and.pencil")
//
//          .padding(.trailing)
////                        .frame(width: geometry.size.width / 4)
//          .onTapGesture {
//            editMenu.toggle()
//          }
//          .foregroundColor(.blue)
//      }
//    }

//  }
//}



//struct ToggleViewIngredient: View {
//  let title: String = "Ingredients"
//  let ingredients:[Ingredient]
//  @State var isExpanded: Bool = false
//  
//  init(_ ingredients: [Ingredient]) {
//    self.ingredients = ingredients
//  }
//  
//  var body: some View {
//    VStack(alignment:.leading){
//      HStack {
//        Text(title)
//        Spacer()
//        Image(systemName: "chevron.down")
//          .rotationEffect(.degrees(isExpanded ? -180 : 0))
//      }
//      .padding(.horizontal)
//      .frame(height: 40)
//      .onTapGesture {
//        withAnimation(.snappy) {
//          isExpanded.toggle()
//        }
//      }
//    }
//    .padding(.horizontal)
//  }
//}


//struct ToggleViewInstruction: View {
//  let title: String = "Instructions"
//  @State var instructions: [String]
//  @State var isExpanded: Bool = false
//  
//  init(_ instructions: [String]) {
//    self.instructions = instructions
//  }
//  
//  var body: some View {
//    VStack{
//      HStack {
//        Text(title)
//        Spacer()
//        Image(systemName: "chevron.down")
//          .rotationEffect(.degrees(isExpanded ? -180 : 0))
//      }
//      .padding(.horizontal)
//      .frame(height: 40)
//      .onTapGesture {
//        withAnimation(.snappy) {
//          isExpanded.toggle()
//        }
//      }
//      if isExpanded {
//        VStack(alignment: .leading){
//          ForEach(instructions, id: \.self) { ins in
//            HStack{
//              Text("\(ins)")
//            }
//          }
//        }.padding(.horizontal)
//      }
//    } .padding(.horizontal)
//  }
//}

#Preview{
  NavigationStack {
    RecipeView(recipe: templateData().days[0].lunch, hitSaved: .constant(false))
  }
  .environmentObject(AllRecipes())
}
