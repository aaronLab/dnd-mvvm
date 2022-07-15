//
//  ModelReesponseV2GetNews.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

struct ModelReesponseV2GetNews: Decodable {
  let status: String

  let totalResults: Int

  let articles: [ModelReesponseV2GetArticle]
}
