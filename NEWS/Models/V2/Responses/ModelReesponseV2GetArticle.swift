//
//  ModelReesponseV2GetArticle.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

struct ModelReesponseV2GetArticle: Decodable {
  let source: ModelReesponseV2GetSource?

  let author: String?

  let title: String?

  let description: String?

  let url: String?

  let urlToImage: String?

  let publishedAt: String?

  let content: String?
}

extension ModelReesponseV2GetArticle {
  var convertedUrl: URL? {
    guard let url = url else { return nil }

    return URL(string: url)
  }
  
  var convertedImageUrl: URL? {
    guard let url = urlToImage else { return nil }
    
    return URL(string: url)
  }

  var convertedPublishedAt: String? {
    guard let publishedAt = publishedAt,
          let splitted = publishedAt.split(separator: "T").first else {
      return nil
    }

    return String(splitted)
  }
}
