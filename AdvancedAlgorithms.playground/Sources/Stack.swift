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
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}
