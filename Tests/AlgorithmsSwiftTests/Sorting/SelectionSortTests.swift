//
//  SelectionSortTests.swift
//  
//
//  Created by Kevin Peng on 2022-02-14.
//

import XCTest
import AlgorithmsSwift

final class SelectionSortTests: XCTestCase {
    func test() {
        let input = [3, 5, 9, 1, 2]
        let sut: ([Int]) -> [Int] = SortingAlgorithms.selectionSort
        let result = sut(input)
        XCTAssertEqual(result, input.sorted())
    }
}
