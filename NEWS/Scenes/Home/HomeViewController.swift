//
//  HomeViewController.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import RxCocoa
import RxDataSources
import RxSwift
import SafariServices
import UIKit

let tableViewCellIdentifier = "homeTableViewCellIdentifier"

class HomeViewController: ViewController {
  let refreshControl = UIRefreshControl()

  let tableView = UITableView(frame: .zero)
    .then {
      $0.separatorStyle = .singleLine
    }

  let viewModel = HomeViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.getArticles()
    
    bindTableView()
  }

  override func addViews() {
    super.addViews()

    tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
    tableView.delegate = self
    view.addSubview(tableView)

    tableView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(getArticles), for: .valueChanged)
  }

  @objc
  private func getArticles() {
    viewModel.getArticles()
  }

  override func layoutViews() {
    super.layoutViews()

    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  override func configureViewModel() {
    super.configureViewModel()

    // Bind loading
    viewModel.output.isLoading
      .withUnretained(self)
      .subscribe(onNext: { owner, isLoading in
        if isLoading {
          owner.refreshControl.beginRefreshing()
          return
        }

        if owner.refreshControl.isRefreshing {
          owner.refreshControl.endRefreshing()
        }
      })
      .disposed(by: bag)

    // Bind datasource to tableView
    viewModel.output.dataSource
      .bind(to: tableView.rx.items(dataSource: tableViewDataSource()))
      .disposed(by: bag)

    viewModel.output.articles
      .withUnretained(self)
      .subscribe(onNext: { owner, _ in
        owner.tableView.reloadData()
      })
      .disposed(by: bag)
  }
  
  private func bindTableView() {
    tableView.rx.itemSelected
      .asDriver()
      .drive(onNext: { [weak self] indexPath in
        guard let self = self else { return }
        self.tableView.deselectRow(at: indexPath, animated: true)
      })
      .disposed(by: bag)

    tableView.rx.modelSelected(ModelReesponseV2GetArticle.self)
      .asDriver()
      .drive(onNext: { [weak self] article in
        guard let self = self,
              let url = article.convertedUrl,
              UIApplication.shared.canOpenURL(url) else {
          return
        }

        self.openSafari(with: url)
      })
      .disposed(by: bag)
  }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    136.0
  }
}
