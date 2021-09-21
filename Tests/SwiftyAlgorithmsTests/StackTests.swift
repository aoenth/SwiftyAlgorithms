import XCTest
@testable import SwiftyAlgorithms

final class DepthFirstSearchTests: XCTestCase {
    func test() throws {
        var stack = Stack<Int>(capacity: 10)
        stack.push(element: 1)
        stack.push(element: 2)

        print(stack)
        stack.pop()
        stack.pop()
        stack.push(element: 5)
        stack.push(element: 3)
        stack.push(element: 4)

        print(stack)
    }
}
