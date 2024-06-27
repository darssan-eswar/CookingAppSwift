//
//  User.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

final class User: Identifiable, ObservableObject {
  static let shared: User? = nil
  
  @Published var id: String
  @Published var username: String
  @Published var email: String
  @Published var recipes: [Recipe]
  var token: String?
  
  private init(
    id: String,
    username: String,
    email: String,
    recipes: [Recipe],
    token: String? = nil
  ) {
    self.id = id
    self.username = username
    self.email = email
    self.recipes = recipes
    self.token = token
  }
}
