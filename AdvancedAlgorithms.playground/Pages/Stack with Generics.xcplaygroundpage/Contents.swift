//: [Previous](@previous)

import Foundation

enum StackError: Error {
    case Empty(message: String)
}

protocol Stackable {
    associatedtype Element: Equatable
    mutating func push(element: Element)
    mutating func pop() -> Element?
    func peek() throws -> Element
    func isEmpty() -> Bool
    func count() -> Int
    subscript(i: Int) -> Element { get }
}

public struct Stack<T: Equatable>: Stackable {
    
    public typealias Element = T
    var array = [T]()
    
    init(capacity: Int) {
        array.reserveCapacity(capacity)
    }
    
    public mutating func push(element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() throws -> T {
        guard !isEmpty(), let lastElement = array.last else {
            throw StackError.Empty(message: "Array is empty")
        }
        return lastElement
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    func count() -> Int {
        return array.count
    }
    
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return array.map { "\($0)" }.joined(separator: ", ")
    }
}

extension Stack: Collection {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.pop() }
    }
    
    public subscript(i: Int) -> T {
        return array[i]
    }
    
    public var startIndex: Int {
        return array.startIndex
    }
    
    public var endIndex: Int {
        return array.endIndex
    }
    
    public func index(after i: Int) -> Int {
        return array.index(after: i)
    }
}

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}

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

