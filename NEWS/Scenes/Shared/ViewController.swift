//
//  ViewController.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import RxSwift
import UIKit

class ViewController: UIViewController {
  var bag = DisposeBag()

  var apiSession: APIService = APISession()

  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    layoutViews()
    bindViews()
  }

  deinit {
    bag = DisposeBag()
  }

  func addViews() {}

  func layoutViews() {}

  func bindViews() {}
}

extension ViewController: Service {}
