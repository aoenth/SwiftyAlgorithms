import Foundation

// Implementation of LinkedList
// https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure

public class Node<T> {
    public var value: T
    public var next: Node?
    public var previous: Node?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
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
    
//    public func reverse() {
//        guard !isEmpty else { return }
//        let newHead = Node(value: tail!.value)
//        
//        while tail != newHead {
//            var newFirst = head?.next
//            tail.next = head
//            head?.previous = tail
//            head.next = nil
//            newFirst.previous = nil
//            tail = head
//            head = newFirst
//        }
//    }
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
