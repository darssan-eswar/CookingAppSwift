//
//  ContentView.swift
//  CookingApp
//
//  Created by Matt Linder on 6/23/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var user = User.shared
  
  var body: some View {
    if user.isLoggedIn {
      ProtectedView()
        .environmentObject(user)
    } else {
      AuthView()
    }
  }
}

enum AuthPage {
  case login, register
}

struct AuthView: View {
  @State var page: AuthPage = .login
  
  var body: some View {
    switch page {
    case .login:
      LoginView(page: $page)
    case .register:
      RegisterView(page: $page)
    }
  }
}

struct ProtectedView: View {
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
