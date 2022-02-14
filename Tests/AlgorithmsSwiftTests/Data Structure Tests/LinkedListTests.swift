//
//  LinkedListTests.swift
//  
//
//  Created by Kevin Peng on 2022-02-14.
//

import AlgorithmsSwift
import XCTest

final class LinkedListTests: XCTestCase {
    func test_addAll_addEqualNumberOfNodes() {
        var sut = LinkedList<Int>()
        (0 ... 5).forEach { i in
            sut.append(value: i)
        }

        var another = LinkedList<Int>()
        (6 ... 10).forEach { i in
            another.append(value: i)
        }

        var expected = LinkedList<Int>()
        (0 ... 10).forEach { i in
            expected.append(value: i)
        }

        sut.addAll(another)
        XCTAssertEqual(expected, sut)
    }

    func test_addAll_addOneNode() {
        var sut = LinkedList<Int>()
        (0 ... 5).forEach { i in
            sut.append(value: i)
        }

        var another = LinkedList<Int>()
        another.append(value: 6)

        var expected = LinkedList<Int>()
        (0 ... 6).forEach { i in
            expected.append(value: i)
        }

        sut.addAll(another)
        XCTAssertEqual(expected, sut)
    }

    func test_addFirst() {
        var sut = LinkedList<Int>()
        (1 ... 5).forEach { i in
            sut.addFirst(value: i)
            XCTAssertEqual(sut.first?.value, i)
            XCTAssertEqual(sut.last?.value, 1)
        }
    }

    func test_append() {
        var sut = LinkedList<Int>()
        (1 ... 5).forEach { i in
            sut.append(value: i)
            XCTAssertEqual(sut.first?.value, 1)
            XCTAssertEqual(sut.last?.value, i)
        }
    }
}
