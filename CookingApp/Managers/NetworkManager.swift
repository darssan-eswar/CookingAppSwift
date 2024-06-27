//
//  NetworkManager.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

class NetworkManager {
  
  private var baseUrl = ""
  private var headers = ["Content-Type" : "application/json"]
  
  private init() {}
  
  func setBaseUrl(_ url: String) {
    self.baseUrl = url
    if url.last != "/" {
      baseUrl += "/"
    }
  }
  
  func setHeaders(_ headers: [String : String]) {
    self.headers = headers
  }
  
  func addHeaders(_ headers: [String : String]) {
    self.headers.merge(headers) { $1 }
  }
  
  func GET<T: Decodable>(_ path: String, headers: [String : String] = [:]) async throws -> T {
    guard let url = URL(string: "\(baseUrl)\(path)") else { throw CookingAppError.invalidUrl }
    
    var request = URLRequest(url: url)
    self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
      } catch {
        throw CookingAppError.failedDecode
      }
    } catch {
      throw CookingAppError.failedRequest
    }
  }
  
  func POST<T: Decodable>(_ path: String, body: Data, headers: [String : String] = [:]) async throws -> T {
    guard let url = URL(string: "\(baseUrl)\(path)") else { throw CookingAppError.invalidUrl }
    
    var request = URLRequest(url: url)
    self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    
    request.httpBody = body
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
      } catch {
        throw CookingAppError.failedDecode
      }
    } catch {
      throw CookingAppError.failedRequest
    }
  }
  
  func PUT<T: Decodable>(_ path: String, body: Data, headers: [String : String] = [:]) async throws -> T? {
    guard let url = URL(string: "\(baseUrl)\(path)") else { throw CookingAppError.invalidUrl }
    
    var request = URLRequest(url: url)
    self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    
    request.httpBody = body
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
      } catch {
        throw CookingAppError.failedDecode
      }
    } catch {
      throw CookingAppError.failedRequest
    }
  }
  
  func PATCH<T: Decodable>(_ path: String, body: Data, headers: [String : String] = [:]) async throws -> T? {
    guard let url = URL(string: "\(baseUrl)\(path)") else { throw CookingAppError.invalidUrl }
    
    var request = URLRequest(url: url)
    self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    
    request.httpBody = body
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
      } catch {
        throw CookingAppError.failedDecode
      }
    } catch {
      throw CookingAppError.failedRequest
    }
  }
  
  func DELETE<T: Decodable>(_ path: String, headers: [String : String] = [:]) async throws -> T? {
    guard let url = URL(string: "\(baseUrl)\(path)") else { throw CookingAppError.invalidUrl }
    
    var request = URLRequest(url: url)
    self.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      do {
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
      } catch {
        throw CookingAppError.failedDecode
      }
    } catch {
      throw CookingAppError.failedRequest
    }
  }
}
