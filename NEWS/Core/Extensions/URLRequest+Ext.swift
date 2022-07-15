//
//  URLRequest+Ext.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation

extension URLRequest {
  /// Content-Type JSON Request Header 적용
  private mutating func applyJSONHeader() {
    setValue("application/json", forHTTPHeaderField: APIHeader.contentType.rawValue)
  }

  /// Method 적용
  private mutating func applyMethod(_ method: HTTPMethod = .get) {
    httpMethod = method.rawValue
  }

  /// Apply headers
  private mutating func applyHeaders(_ headers: Headers? = nil) {
    guard let headers = headers else {
      return
    }

    headers.forEach { key, value in
      setValue(value, forHTTPHeaderField: key)
    }
  }

  /// JSON Request
  private static func createJSONRequest(endpoint: Endpoint,
                                        headers: Headers? = nil) -> URLRequest {
    var request = URLRequest(url: endpoint.url)
    request.applyJSONHeader()
    request.applyMethod(endpoint.httpMethod)
    request.applyHeaders(headers)
    return request
  }

  /// Request with data body
  static func build(endpoint: Endpoint,
                    dataBody: Data? = nil,
                    headers: Headers? = nil) -> URLRequest {
    var request = URLRequest.createJSONRequest(endpoint: endpoint,
                                               headers: headers)

    request.httpBody = dataBody

    return request
  }
}
