//
//  ServiceV2TopHeadlines.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation
import RxSwift

protocol ServiceV2TopHeadlines: Service {
  func getUsBusiness(query: DtoV2GetTopHeadlinesQuery) -> Single<ModelReesponseV2GetNews>
}

extension ServiceV2TopHeadlines {
  func getUsBusiness(query: DtoV2GetTopHeadlinesQuery) -> Single<ModelReesponseV2GetNews> {
    let endpoint = EndpointV2TopHeadlines.usBusiness(query: query)

    let request = URLRequest.build(endpoint: endpoint)

    return apiSession.request(with: request)
  }
}
