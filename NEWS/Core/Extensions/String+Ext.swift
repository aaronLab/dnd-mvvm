//
//  String+Ext.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

extension String {
  func urlEncoded() -> Self {
    guard let encoded = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
      return .empty
    }

    return encoded
  }

  static let empty: String = ""
}
