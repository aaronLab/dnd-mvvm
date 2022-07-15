//
//  Endpoint.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation

protocol Endpoint {
  /// API URL
  var apiVersion: APIVersion { get }

  /// 컨트롤러 Path
  var prefix: String { get }

  /// 엔드포인트
  var endpoint: String { get }

  /// URL String
  var urlString: String { get }

  /// URL
  var url: URL { get }

  /// HTTP Method
  var httpMethod: HTTPMethod { get }
}

extension Endpoint {
  var urlString: String {
    "\(apiVersion.urlStr)\(prefix)\(endpoint)".urlEncoded()
  }

  var url: URL {
    guard let url = URL(string: urlString) else {
      fatalError("Invalid URL format")
    }

    return url
  }
}
