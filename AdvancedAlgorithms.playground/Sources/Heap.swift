import Foundation
/*
public struct Heap {
    var array: [Int]
    
    public init() {
        self.array = [Int]()
    }
    
    public mutating func add(_ value: Int) {
        var array = self.array
        array.append(value)
        
        // if it's added to the left of a parent
        if array.count > 2 {
            if array[array.endIndex - 1] < value {
                swap(array[array.endIndex - 1], array.last!)
            }
        }
        
        // look at right parent
        
        
    }
}
*/
// https://www.raywenderlich.com/586-swift-algorithm-club-heap-and-priority-queue-data-structure
public struct Heap<Element: Equatable> {
    var elements: [Element]
    let priorityFunction: (Element, Element) -> Bool
    
    // if not provided, give it an empty array
    public init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    private mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public func peek() -> Element? {
        return elements.first
    }
    
    public mutating func remove(_ element: Element) {
        if let index = elements.firstIndex(of: element) {
            elements.remove(at: index)
            buildHeap()
        }
    }
    
    public mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }
    
    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent) else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }
    
    public mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(of: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
    
    func isRoot(_ index: Int) -> Bool {
        return (index == 0)
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(of parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        // used to be swap(&elements[firstIndex], &elements[secondIndex]) in Swift 3
        elements.swapAt(firstIndex, secondIndex)
    }
}
