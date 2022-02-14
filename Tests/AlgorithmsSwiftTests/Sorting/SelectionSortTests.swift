//
//  SelectionsortTests.swift
//  
//
//  Created by Kevin Peng on 2022-02-14.
//

import XCTest
import AlgorithmsSwift

final class SelectionsortTests: XCTestCase {
    func test() {
        let input = [3, 5, 9, 1, 2]
        let sut: ([Int]) -> [Int] = SortingAlgorithms.selectionsort
        let result = sut(input)
        XCTAssertEqual(result, input.sorted())
    }
}
