//
//  HomeTableViewCell.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Kingfisher
import SnapKit
import Then
import UIKit

class HomeTableViewCell: UITableViewCell {
  let thumbnailImageView = UIImageView()
    .then {
      $0.contentMode = .scaleAspectFill
      $0.backgroundColor = .gray
      $0.clipsToBounds = true
    }

  let stackView = UIStackView()
    .then {
      $0.axis = .vertical
      $0.alignment = .fill
      $0.distribution = .fill
      $0.spacing = 4.0
    }

  let titleLabel = UILabel()
    .then {
      $0.font = .preferredFont(forTextStyle: .title3)
      $0.textAlignment = .left
      $0.numberOfLines = 2
    }

  let descriptionLabel = UILabel()
    .then {
      $0.font = .preferredFont(forTextStyle: .body)
      $0.textAlignment = .left
      $0.numberOfLines = 2
    }

  let timestampLabel = UILabel()
    .then {
      $0.font = .preferredFont(forTextStyle: .caption1)
      $0.textAlignment = .right
      $0.numberOfLines = 1
    }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addViews()
    layoutViews()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    addViews()
    layoutViews()
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    descriptionLabel.text = nil
    timestampLabel.text = nil

    thumbnailImageView.kf.cancelDownloadTask()
    thumbnailImageView.image = nil
  }

  private func addViews() {
    addSubview(thumbnailImageView)

    addSubview(stackView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(descriptionLabel)
    stackView.addArrangedSubview(timestampLabel)
  }

  private func layoutViews() {
    layoutThumbnailImageView()
    layoutStackView()
  }

  private func layoutThumbnailImageView() {
    thumbnailImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8.0)
      $0.leading.equalToSuperview().offset(8.0)
      $0.bottom.equalToSuperview().offset(-8.0)
      $0.width.equalTo(thumbnailImageView.snp.height).multipliedBy(1.2)
    }
  }

  private func layoutStackView() {
    stackView.snp.makeConstraints {
      $0.top.equalTo(thumbnailImageView)
      $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(8.0)
      $0.trailing.equalToSuperview().offset(-16.0)
      $0.bottom.lessThanOrEqualTo(thumbnailImageView)
    }
  }
}

extension HomeTableViewCell {
  func applyArticle(with article: ModelReesponseV2GetArticle) {
    titleLabel.text = article.title
    descriptionLabel.text = article.description
    timestampLabel.text = article.convertedPublishedAt

    thumbnailImageView.kf.setImage(with: article.convertedImageUrl)
  }
}
