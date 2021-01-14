//
//  Binary Search.swift
//  Snippets
//
//  Created by Warren Hansen on 1/13/21.
//  Copyright © 2021 Warren Hansen. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    let range = range ?? startIndex..<endIndex

    guard range.lowerBound < range.upperBound else {
      return nil
    }

    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)
    if self[middle] == value {
      return middle
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}

/*
 Use
    let array = [1, 5, 18, 32, 33, 33, 47, 49, 502]
    let indexOfTarget = array.binarySearch(for: 5)
 */
