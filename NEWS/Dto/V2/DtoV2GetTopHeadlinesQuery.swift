//
//  DtoV2GetTopHeadlinesQuery.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

struct DtoV2GetTopHeadlinesQuery: DtoQuery {
  let country: String

  let category: String

  let apiKey: String

  init(country: Country = .us,
       category: Category,
       apiKey: String = NEWS.apiKey) {
    self.country = country.rawValue
    self.category = category.rawValue
    self.apiKey = apiKey
  }
}

// MARK: - Country

extension DtoV2GetTopHeadlinesQuery {
  enum Country: String {
    case us
  }
}

// MARK: - Category

extension DtoV2GetTopHeadlinesQuery {
  enum Category: String {
    case business
  }
}
