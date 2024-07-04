//
//  RecipeSearchView.swift
//  CookingApp
//
//  Created by Arshia Eslami on 7/3/24.
//

import Foundation

import SwiftUI

struct RecipeSearchView: Identifiable, View {
  let id : String = UUID().uuidString
  let allItems = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape"]

  @State var typedText : String = ""
  var filterdList : [String]{
    if typedText.isEmpty {
      return allItems
    } else {
      return allItems.filter {
        $0.lowercased().contains(typedText.lowercased())
      }
    }
  }
  
  @State var isSearching : Bool = false
  
  var body: some View {
   
      VStack {
          HStack {
            TextField("Search...", text: $typedText)
              .padding()
              .background(.gray)
              .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
              .foregroundColor(.white)
   
            
              .cornerRadius(8)
          }
          .padding()
          
              List(filterdList, id: \.self) { item in
                Text(item)
            
          }
        
        
      }

    
  }
}

#Preview {
  RecipeSearchView(typedText: "")
}
