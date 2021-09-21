import Foundation

public class BreadthFirstSearch {
    
    public init() {
        
    }
    
    public func bfs(root: Vertex) {
        var queue = Queue<Vertex>()
        
        root.visited = true
        queue.enqueue(root)
        
        while (!queue.isEmpty()) {
            if let actualVertex = queue.dequeue() {
                print(actualVertex)
                
                for v in actualVertex.adjacenciesList {
                    if (!v.visited) {
                        v.visited = true
                        queue.enqueue(v)
                    }
                }
            }
        }
        
    }
}
