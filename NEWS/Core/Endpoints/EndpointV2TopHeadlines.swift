//
//  EndpointV2TopHeadlines.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation

enum EndpointV2TopHeadlines {
  case usBusiness(query: DtoV2GetTopHeadlinesQuery)
}

extension EndpointV2TopHeadlines: Endpoint {
  var apiVersion: APIVersion {
    .v2
  }

  var prefix: String {
    switch self {
    case .usBusiness:
      return "/top-headlines"
    }
  }

  var endpoint: String {
    switch self {
    case let .usBusiness(query):
      return query.queryStr()
    }
  }

  var httpMethod: HTTPMethod {
    switch self {
    case .usBusiness:
      return .get
    }
  }
}
