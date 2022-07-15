//
//  Service.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Alamofire
import Foundation

protocol Service: AnyObject {
  var apiSession: APIService { get }
}
