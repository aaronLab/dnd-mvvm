//
//  ViewModel.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/17.
//

import Foundation
import RxSwift

class ViewModel {
  var bag: DisposeBag = .init()

  var apiSession: APIService = APISession()

  deinit {
    bag = DisposeBag()
  }
}

extension ViewModel: Service {}
