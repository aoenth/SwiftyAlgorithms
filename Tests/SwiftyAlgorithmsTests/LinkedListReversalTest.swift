import XCTest
@testable import SwiftyAlgorithms

class LinkedListReversalTest: XCTestCase {
    var ll: LinkedList<Int>!

    override func setUp() {
        ll = LinkedList<Int>()
    }

    func testThatLLAreInstantiable() {
        XCTAssertNotNil(ll)
    }

    func testWithOneArgument() {
        ll.append(value: 1)
        ll.reverse()

        let llExpected = LinkedList<Int>()
        llExpected.append(value: 1)

        XCTAssertEqual(ll.description, llExpected.description)
    }

    func testWithTwoArguments() {
        ll.append(value: 1)
        ll.append(value: 2)
        ll.reverse()

        let llExpected = LinkedList<Int>()
        llExpected.append(value: 2)
        llExpected.append(value: 1)

        XCTAssertEqual(ll.description, llExpected.description)
    }

    func testWithThreeArguments() {
        ll.append(value: 1)
        ll.append(value: 2)
        ll.append(value: 3)
        ll.reverse()

        let llExpected = LinkedList<Int>()
        llExpected.append(value: 3)
        llExpected.append(value: 2)
        llExpected.append(value: 1)

        XCTAssertEqual(ll.description, llExpected.description)
    }

}
