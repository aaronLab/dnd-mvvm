//
//  HomeViewModel.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/17.
//

import Foundation
import RxCocoa
import RxSwift

class HomeViewModel: ViewModel {
  var input: Input = .init()

  var output: Output = .init()
}

// MARK: - ViewModelType

extension HomeViewModel: ViewModelType {
  struct Input {}

  struct Output {
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var articles: BehaviorRelay<[ModelReesponseV2GetArticle]> = BehaviorRelay(value: [])

    var dataSource: Observable<[HomeDataSource]> {
      articles
        .map {
          [HomeDataSource(section: .zero, items: $0)]
        }
    }
  }
}

// MARK: - ServiceV2TopHeadlines

extension HomeViewModel: ServiceV2TopHeadlines {
  func getArticles() {
    guard !output.isLoading.value else { return }
    
    let query = DtoV2GetTopHeadlinesQuery(category: .business)

    output.isLoading.accept(true)

    getUsBusiness(query: query)
      .map(\.articles)
      .subscribe(onSuccess: { [weak self] articles in
        guard let self = self else { return }
        self.output.articles.accept(articles)

        self.output.isLoading.accept(false)
      }, onFailure: { [weak self] error in
        guard let self = self else { return }

        print(error)
        self.output.isLoading.accept(false)
      })
      .disposed(by: bag)
  }
}
