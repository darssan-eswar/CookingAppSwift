//
//  ContentView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/23/24.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
      TabView {
        HomeView()
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        CalendarView()
          .tabItem {
            Image(systemName: "calendar")
            Text("Calendar")
          }
        ShoppingView()
          .tabItem {
            Image(systemName: "cart.fill")
            Text("Shopping")
          }
      }
  }
}

#Preview {
  ContentView()
}
