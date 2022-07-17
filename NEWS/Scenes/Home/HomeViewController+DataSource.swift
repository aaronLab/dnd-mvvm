//
//  HomeViewController+DataSource.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/17.
//

import Foundation
import RxDataSources

// MARK: - DataSources

extension HomeViewController {
  func tableViewDataSource() -> RxTableViewSectionedReloadDataSource<HomeDataSource> {
    RxTableViewSectionedReloadDataSource<HomeDataSource>(
      configureCell: { dataSource, tableView, indexPath, item in
        guard let cell = tableView.dequeueReusableCell(
          withIdentifier: tableViewCellIdentifier,
          for: indexPath
        ) as? HomeTableViewCell else {
          fatalError("There's no such cell")
        }

        cell.applyArticle(with: item)

        return cell
      }
    )
  }
}
