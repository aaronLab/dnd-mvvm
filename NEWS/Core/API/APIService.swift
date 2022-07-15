//
//  APIService.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation
import RxSwift

protocol APIService {
  func request<T>(with request: URLRequest) -> Single<T> where T: Decodable

  func applyResult<T>(observer: (Result<T, Error>) -> Void,
                      result: DataResponse<T, AFError>) where T: Decodable
}

extension APIService {
  func applyResult<T>(observer: (Result<T, Error>) -> Void,
                      result: DataResponse<T, AFError>)
    where T: Decodable {
    guard let response = result.response else {
      observer(.failure(APIError.unknown))
      return
    }

    guard (200 ... 399).contains(response.statusCode) else {
      observer(.failure(APIError.http(status: response.statusCode)))
      return
    }

    guard let decoded = result.value else {
      observer(.failure(APIError.decode))
      return
    }

    observer(.success(decoded))
  }
}
