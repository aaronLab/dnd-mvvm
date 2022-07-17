//
//  ViewController.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import RxSwift
import SafariServices
import UIKit

class ViewController: UIViewController {
  var bag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    layoutViews()
    bindViews()
    configureViewModel()
  }

  deinit {
    bag = DisposeBag()
  }

  func addViews() {}

  func layoutViews() {}

  func bindViews() {}

  func configureViewModel() {}

  func openSafari(with url: URL) {
    DispatchQueue.main.async {
      let sfViewController = SFSafariViewController(url: url)
      self.present(sfViewController, animated: true)
    }
  }
}
