import Foundation

public class DepthFirstSearch {
    private var stack: Stack<Vertex>
    
    public init() {
        self.stack = Stack<Vertex>()
    }
    
    // Required because there may be disconnections between "clusters"
    public func dfs(vertexList: [Vertex]) {
        for v in vertexList {
            if !v.visited {
                v.visited = true
                dfsRecursive(vertex: v)
//                dfsWithStack(v)
            }
        }
    }
    
    private func dfsWithStack(_ rootVertex: Vertex) {
        self.stack.push(rootVertex)
        rootVertex.visited = true
        
        while !stack.isEmpty() {
            if let actualVertex = stack.pop() {
                print(actualVertex)
                
                for v in actualVertex.neighbourList {
                    if !v.visited {
                        v.visited = true
                        stack.push(v)
                    }
                }
            }
            
        }
        
    }
    
    private func dfsRecursive(vertex: Vertex) {
        print(vertex)
        
        for v in vertex.neighbourList {
            if !v.visited {
                v.visited = true
                dfsRecursive(vertex: v)
            }
        }
    }
}
