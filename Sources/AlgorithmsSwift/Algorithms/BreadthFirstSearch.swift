import Foundation

class BreadthFirstSearch {

    func bfs(root: Vertex, onVisit: (Vertex) -> Void = { _ in }) {
        var queue = Queue<Vertex>()
        
        root.visited = true
        queue.enqueue(root)
        
        while (!queue.isEmpty()) {
            if let actualVertex = queue.dequeue() {
                onVisit(actualVertex)

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
