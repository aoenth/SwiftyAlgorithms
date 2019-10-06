//: [Previous](@previous)

import Foundation

enum StackError: Error {
    case Empty(message: String)
}

public struct Stack {
    var array = [Int]()
    
    init(capacity: Int) {
        array.reserveCapacity(capacity)
    }
    
    public mutating func push(element: Int) {
        array.append(element)
    }
    
    public mutating func pop() -> Int? {
        return array.popLast()
    }
    
    public func peek() throws -> Int {
        guard !isEmpty(), let lastElement = array.last else {
            throw StackError.Empty(message: "Array is empty")
        }
        return lastElement
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return array.map { "\($0)" }.joined(separator: ", ")
    }
}

var stack = Stack(capacity: 10)
stack.push(element: 1)
stack.push(element: 2)

print(stack)
stack.pop()
stack.pop()
stack.push(element: 5)
stack.push(element: 3)
stack.push(element: 4)

print(stack)

