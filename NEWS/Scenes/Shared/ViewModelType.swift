//
//  ViewModelType.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/17.
//

import Foundation

protocol ViewModelType {
  associatedtype Input
  associatedtype Output

  var input: Input { get }

  var output: Output { get }
}
