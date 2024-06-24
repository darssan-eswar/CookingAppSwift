//
//  ShoppingView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import SwiftUI

struct ShoppingView: View {
  @State var ingredients = ["Bread", "Milk", "Eggs", "Rice", "Pasts", "Chicken"]
  
  var body: some View {
    NavigationStack {
      List($ingredients, id: \.self, editActions: .delete) { ingredient in
        Text("\(ingredient.wrappedValue)")
      }
      .navigationTitle("Shopping List")
    }
  }
}

#Preview {
  ShoppingView()
}
