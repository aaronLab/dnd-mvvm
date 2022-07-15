//
//  APISession.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation
import RxSwift

struct APISession: APIService {
  /// Request
  func request<T>(with request: URLRequest) -> Single<T> where T: Decodable {
    Single<T>.create { observer in
      let task = AF.request(request)
        .responseDecodable(of: T.self) { result in

          autoreleasepool {
            self.applyResult(observer: observer, result: result)
          }
        }

      return Disposables.create {
        task
          .cancel()
      }
    }
  }
}
