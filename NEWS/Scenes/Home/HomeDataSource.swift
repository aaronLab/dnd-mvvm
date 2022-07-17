//
//  HomeDataSource.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/17.
//

import Foundation
import RxDataSources

struct HomeDataSource {
  var section: Int
  var items: [Item]
}

extension HomeDataSource: SectionModelType {
  typealias Item = ModelReesponseV2GetArticle

  init(original: HomeDataSource, items: [Item]) {
    self = original
    self.items = items
  }
}
