//
//  APIVersion.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

enum APIVersion: String {
  static let baseURLStr = "https://newsapi.org"

  case v2
}

extension APIVersion {
  var urlStr: String {
    switch self {
    case .v2:
      return "\(APIVersion.baseURLStr)/\(rawValue)"
    }
  }
}
