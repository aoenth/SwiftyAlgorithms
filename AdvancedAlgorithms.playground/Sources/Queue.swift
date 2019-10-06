import Foundation

public struct Queue<T> where T: Equatable {
    fileprivate var list = LinkedList<T>()
    
    public init() {
        
    }
    
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
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

