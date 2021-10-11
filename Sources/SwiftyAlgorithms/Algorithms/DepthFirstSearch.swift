import Foundation

public class DepthFirstSearch {
    private var stack: Stack<Vertex>
    
    public init() {
        self.stack = Stack<Vertex>()
    }
    
    // Required because there may be disconnections between "clusters"
    public func dfs(
        vertexList: [Vertex],
        strategy: Implementation,
        onVisit: (Vertex) -> Void = { _ in }
    ) {
        guard vertexList.count > 0 else { return }
        for v in vertexList {
            if !v.visited {
                v.visited = true

                switch strategy {
                case .stack:
                    dfsWithStack(rootVertex: vertexList[0], onVisit: onVisit)
                case .recurse:
                    dfsRecursive(vertex: vertexList[0], onVisit: onVisit)
                }
            }
        }
    }
    
    private func dfsWithStack(rootVertex: Vertex, onVisit: (Vertex) -> Void = { _ in }) {
        self.stack.push(rootVertex)
        rootVertex.visited = true
        
        while !stack.isEmpty() {
            if let actualVertex = stack.pop() {
                onVisit(actualVertex)

                for v in actualVertex.neighbourList {
                    if !v.visited {
                        v.visited = true
                        stack.push(v)
                    }
                }
            }
            
        }
        
    }
    
    private func dfsRecursive(vertex: Vertex, onVisit: (Vertex) -> Void = { _ in }) {
        onVisit(vertex)
        
        for v in vertex.neighbourList {
            if !v.visited {
                v.visited = true
                dfsRecursive(vertex: v, onVisit: onVisit)
            }
        }
    }

    public class Vertex: CustomStringConvertible, Equatable {
        public var data: Int
        public var visited: Bool
        public var neighbourList: [Vertex]
        public var beingVisited: Bool

        public init(data: Int) {
            self.data = data
            self.visited = false
            self.beingVisited = false
            self.neighbourList = [Vertex]()
        }

        public func addNeighbourVertex(vertex: Vertex) {
            neighbourList.append(vertex)
        }

        public var description: String {
            return "Data: \(data), visited: \(visited)"
        }

        public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
            return lhs.data == rhs.data
        }
    }

    struct Stack<T: Equatable> {
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

    public enum Implementation {
        case stack
        case recurse
    }
}

extension DepthFirstSearch.Stack: CustomStringConvertible {
    public var description: String {
        return list.description
    }
}

/**
 Iterating through the Stack begins at the end of the LinkedList, removing from the top, one at at time
 */
extension DepthFirstSearch.Stack: Sequence, IteratorProtocol {
    public mutating func next() -> T? {
        return pop()
    }
}
