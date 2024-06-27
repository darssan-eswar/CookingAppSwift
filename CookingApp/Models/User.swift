//
//  User.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

final class User: Identifiable, ObservableObject {
  static let user: User? = nil
  
  @Published var id: String
  @Published var username: String
  @Published var email: String
  @Published var plannedMeals: [String]
  private var token: String?
  
  private init(id: String, username: String, email: String, plannedMeals: [String], token: String? = nil) {
    self.id = id
    self.username = username
    self.email = email
    self.plannedMeals = plannedMeals
    self.token = token
  }
}
