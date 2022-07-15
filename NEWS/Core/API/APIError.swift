//
//  APIError.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

/// API Request Error
enum APIError: Error {
  /// Decode error
  case decode

  /// HTTP error
  case http(status: Int)

  /// Unknown error
  case unknown
}

// MARK: - Equatable

extension APIError: Equatable {
  static func == (lhs: APIError, rhs: APIError) -> Bool {
    switch (lhs, rhs) {
    case (.decode, .decode):
      return true

    case let (.http(lStatus), .http(rStatus)):
      return lStatus == rStatus

    case (.unknown, .unknown):
      return true

    default:
      return false
    }
  }
}
