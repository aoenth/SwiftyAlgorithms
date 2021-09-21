import Foundation

public struct TopologicalOrdering {
    private var stack: Stack<Vertex>
    
    public func getStack() -> Stack<Vertex> {
        return stack
    }
    
    public init() {
        stack = Stack<Vertex>()
    }
    
    public mutating func dfs(vertex: Vertex) {
        vertex.visited = true
        
        for v in vertex.neighbourList {
            if !v.visited {
                dfs(vertex: v)
            }
        }
        
        stack.push(vertex)
    }
}
