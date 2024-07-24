//
//  RecipeSearchView.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/3/24.
//

import Foundation

import SwiftUI


struct IngSearchView : View {
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
  }
}


struct RecipeSearchView: Identifiable, View {
  @EnvironmentObject var allRecipes : AllRecipes
  @Binding  var currMeal : Meal?
  @Binding var showingPopover : Bool
  let id : String = UUID().uuidString
  
  @State var typedText : String = ""
  var filterdList : [Recipe]{
    if typedText.isEmpty {
      return allRecipes.recipes.map {$0}
    } else {
      return allRecipes.recipes.map {$0}.filter {
        $0.name.lowercased().contains(typedText.lowercased())
      }
    }
  }
  
  @State var isSearching : Bool = false
  
  var body: some View {
   
    ScrollView {
    LazyVStack (spacing : 0){
      HStack {
        TextField("Search...", text: $typedText)
          .padding()
          .background(.gray)
          .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
        
        
          .cornerRadius(8)
      }
      .padding()
      
      ForEach(filterdList, id: \.id) { item in
        Button(action: {
          currMeal?.recipe = item
          showingPopover = false
        }, label: {
          RoundedRectangle(cornerRadius: 20)
            .fill(.gray)
            .frame(width: 200, height: 30)
            .overlay {
              
              Text(item.name)
            }
        })
        .foregroundStyle(.black)
        
      }
      
      
    }
  }
  }
}
//#Preview {
//  RecipeSearchView(currRecipe: .constant(Recipe()))
//  // For preview on its own
//    .environmentObject(AllRecipes())
//}
