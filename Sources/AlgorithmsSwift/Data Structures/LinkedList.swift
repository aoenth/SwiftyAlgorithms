import Foundation

// Implementation of LinkedList
// https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure

public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode?
    public var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public struct LinkedList<T> {
    fileprivate var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?
    
    public init() { }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: LinkedListNode<T>? {
        return head
    }
    
    public var last: LinkedListNode<T>? {
        return tail
    }
    
    mutating public func append(value: T) {
        let newNode = LinkedListNode(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }

    mutating public func addFirst(value: T) {
        let newNode = LinkedListNode(value: value)
        switch status {
        case .oneNode, .twoOrMoreNodes:
            newNode.next = head
            head?.previous = newNode
            head = newNode
        case .empty:
            head = newNode
            tail = newNode
        }
    }

    private var status: Status {
        if head == nil && tail == nil {
            return .empty
        } else if head === tail {
            return .oneNode
        } else {
            return .twoOrMoreNodes
        }
    }

    enum Status {
        case empty
        case oneNode
        case twoOrMoreNodes
    }

    mutating public func addAll(_ other: LinkedList<T>) {
        var currentNode = other.head
        while let node = currentNode {
            tail?.next = node
            tail = node
            currentNode = node.next
        }
    }

    mutating public func removeFirst() {
        if head === tail {
            tail = nil
            head = nil
        } else {
            head = first?.next
        }
    }
    
    mutating public func removeAll() {
        head = nil
        tail = nil
    }
    
    mutating public func remove(node: LinkedListNode<T>) -> T {
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
    
    mutating public func reverse() {
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
        var currentNode = head
        
        while let node = currentNode {
            text += "\(node.value)"
            currentNode = node.next
            if currentNode != nil { text += "-> " }
        }
        return text + "]"
    }
}

extension LinkedList: Equatable where T: Equatable {
    public static func == (lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        var lhsNode = lhs.head
        var rhsNode = rhs.head

        while let lhs = lhsNode, let rhs = rhsNode {
            if lhs.value != rhs.value {
                return false
            }
            lhsNode = lhs.next
            rhsNode = rhs.next
        }

        return lhsNode == nil && rhsNode == nil
    }
}
