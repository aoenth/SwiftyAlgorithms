import Foundation

public struct Queue<T> {
    fileprivate var list = LinkedList<T>()
    
    public init() { }
    
    public mutating func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    public mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        return list.remove(node: element)
    }
    
    public func peek() -> T? {
        return list.first?.value
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty
    }

    public var count: Int {
        var currentNode = list.first
        var count = 0
        while let node = currentNode {
            currentNode = node.next
            count += 1
        }
        return count
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

