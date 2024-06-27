//
//  Errors.swift
//  CookingApp
//
//  Created by Matt Linder on 6/24/24.
//

import Foundation

enum CookingAppError: Error {
  case invalidUrl
  case badResponse
  case failedRequest
  case failedDecode
}
