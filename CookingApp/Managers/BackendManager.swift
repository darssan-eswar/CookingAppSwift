//
//  BackendManager.swift
//  CookingApp
//
//  Created by Matt Linder on 6/26/24.
//

import Foundation

final class BackendManager: NetworkManager {
  static let shared = BackendManager()
  
  let baseUrl = "http://127.0.0.1:8080"
  let apiKey = "btg94385hrevobrliqb3erowahf8vreahowfbvaeiulww"
//  let baseUrl = "https://cookingapp.onrender.app"
  
  private init() {
    super.init(baseUrl)
    super.addHeaders(["Authorization": apiKey])
  }
  
  override func GET<T: Decodable>(_ path: String, headers: [String : String] = [:]) async throws -> T {
    return try await super.GET(path, headers: headers.merging(["token" : User.shared.token ?? ""], uniquingKeysWith: { $1 }))
  }
  
  override func POST<T: Decodable>(_ path: String, body: Data? = nil, headers: [String : String] = [:]) async throws -> T {
    return try await super.POST(path, body: body, headers: headers.merging(["token" : User.shared.token ?? ""], uniquingKeysWith: { $1 }))
  }
  
  override func PATCH<T: Decodable>(_ path: String, body: Data? = nil, headers: [String : String] = [:]) async throws -> T {
    return try await super.PATCH(path, body: body, headers: headers.merging(["token" : User.shared.token ?? ""], uniquingKeysWith: { $1 }))
  }
  
  override func PUT<T: Decodable>(_ path: String, body: Data? = nil, headers: [String : String] = [:]) async throws -> T {
    return try await super.PUT(path, body: body, headers: headers.merging(["token" : User.shared.token ?? ""], uniquingKeysWith: { $1 }))
  }
  
  override func DELETE<T: Decodable>(_ path: String, headers: [String : String] = [:]) async throws -> T {
    return try await super.DELETE(path, headers: headers.merging(["token" : User.shared.token ?? ""], uniquingKeysWith: { $1 }))
  }
}
