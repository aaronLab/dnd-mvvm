//
//  HomeViewController.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import RxCocoa
import RxSwift
import UIKit

private let tableViewCellIdentifier = "homeTableViewCellIdentifier"

class HomeViewController: ViewController {
  let refreshControl = UIRefreshControl()
  
  let tableView = UITableView(frame: .zero)
    .then {
      $0.separatorStyle = .singleLine
    }

  var articles: [ModelReesponseV2GetArticle] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    getArticles()
  }

  override func addViews() {
    super.addViews()

    tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
    
    tableView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(getArticles), for: .valueChanged)
  }

  override func layoutViews() {
    super.layoutViews()

    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

// MARK: - ServiceV2TopHeadlines

extension HomeViewController: ServiceV2TopHeadlines {
  @objc
  private func getArticles() {
    let query = DtoV2GetTopHeadlinesQuery(category: .business)
    
    refreshControl.beginRefreshing()

    getUsBusiness(query: query)
      .map(\.articles)
      .subscribe(onSuccess: { [weak self] articles in
        guard let self = self else { return }
        self.articles = articles
        self.tableView.reloadData()
        
        DispatchQueue.main.async {
          self.refreshControl.endRefreshing()
        }
      }, onFailure: { error in
        print(error)
      })
      .disposed(by: bag)
  }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    136.0
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    articles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: tableViewCellIdentifier,
      for: indexPath
    ) as? HomeTableViewCell,
      let article = articles[safe: indexPath.row] else {
      fatalError("There's no such cell")
    }

    cell.applyArticle(with: article)

    return cell
  }
}
