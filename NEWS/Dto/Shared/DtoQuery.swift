//
//  DtoQuery.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

protocol DtoQuery {
  func queryStr() -> String
}

extension DtoQuery {
  func queryStr() -> String {
    let mirror = Mirror(reflecting: self)
    var query: String = .empty

    for child in mirror.children {
      guard let key = child.label,
            let value = child.value as? String else {
        continue
      }

      if query.isEmpty {
        query += "?"
      } else {
        query += "&"
      }

      query += "\(key)=\(value)"
    }

    return query
  }
}
