//
//  Array+Ext.swift
//  NEWS
//
//  Created by Aaron Lee on 2022/07/15.
//

import Foundation

extension Array {
  subscript(safe index: Int) -> Element? {
    indices ~= index ? self[index] : nil
  }
}
