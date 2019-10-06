import Foundation

public struct Stack<T: Equatable> {
    private var list: LinkedList<T>
    
    public init() {
        self.list = LinkedList<T>()
    }
    
    public mutating func push(_ element: T) {
        list.append(value: element)
    }
    
    public mutating func pop() -> T? {
        guard !list.isEmpty, let element = list.last else {
            return nil
        }
        return list.remove(node: element)
    }
    
    public func isEmpty() -> Bool {
        return list.isEmpty
    }
    
    public mutating func reverse() {
        self.list.reverse()
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

/**
 Iterating through the Stack begins at the end of the LinkedList, removing from the top, one at at time
 */
extension Stack: Sequence, IteratorProtocol {
    public mutating func next() -> T? {
        return pop()
    }
}
