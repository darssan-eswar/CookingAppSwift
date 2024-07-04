//
//  User.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

final class User: Identifiable, ObservableObject {
  static let shared: User = User()
  
  @Published var id: String = ""
  @Published var username: String = ""
  @Published var email: String = ""
  @Published var recipes: [Recipe] = []
  @Published var token: String?
  @Published var isLoggedIn = false
  
  private init() {}
  
  @MainActor
  private func authenticate(
    id: String,
    username: String,
    email: String,
    token: String
  ) {
    self.id = id
    self.username = username
    self.email = email
    self.token = token
    self.isLoggedIn = true
  }
  
  // TODO: encode password in login and register before making network request
  static func login(email: String, password: String) {
    Task {
      do {
        let body = ["email": email, "password": password]
        let jsonBody = try JSONEncoder().encode(body)
        let res: UserResponse = try await BackendManager.shared.POST("/auth/login", body: jsonBody)
        await Self.shared.authenticate(
          id: res.id,
          username: res.username,
          email: res.email,
          token: res.token
        )
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  static func register(email: String, username: String, password: String) {
    Task {
      do {
        let body = ["email": email, "username": username, "password": password]
        let jsonBody = try JSONEncoder().encode(body)
        let res: UserResponse = try await BackendManager.shared.POST("/auth/register", body: jsonBody)
        await Self.shared.authenticate(
          id: res.id,
          username: res.username,
          email: res.email,
          token: res.token
        )
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

struct UserResponse: Codable {
  let id: String
  let username: String
  let email: String
  let token: String
}
