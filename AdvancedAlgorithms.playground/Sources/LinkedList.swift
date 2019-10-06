import Foundation

// Implementation of LinkedList
// https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure

public class Node<T> where T: Equatable {
    public var value: T
    public var next: Node?
    public var previous: Node?
    
    public init(value: T) {
        self.value = value
    }
}

extension Node: Equatable where T: Equatable {
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

public class LinkedList<T> where T: Equatable {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {
        
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        else {
            head = newNode
        }
        
        tail = newNode
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        // Not First Node
        if let prev = prev {
            prev.next = next
        } else { // First Node
            head = next
        }
        
        // Last Node
        if let next = next {
            next.previous = prev
        } else {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func reverse() {
        tail = head
        var current = head
        while current != nil {
            let temp = current!.previous
            current!.previous = current!.next
            current!.next = temp
            head = current
            current = current!.previous
        }
    }
        
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
}
