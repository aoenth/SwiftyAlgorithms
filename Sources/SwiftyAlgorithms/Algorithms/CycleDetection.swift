import Foundation

public struct CycleDetection {
    public func detectCycle(vertexList: [Vertex]) {
        for v in vertexList {
            if !v.visited {
                print("New vertex \(v)")
                dfs(vertex: v);
            }
        }

    }

    private func dfs(vertex: Vertex) {
        print("Begin dfs on vertex \(vertex)")
        vertex.beingVisited = true

        for v in vertex.neighbourList {
            if v.beingVisited {
                print("Cycle detected")
                return
            }

            if !v.visited {
                v.visited = true
                print("Visiting vertex \(v) recursively")
                dfs(vertex: v)
            }
        }

        print("Set vertex \(vertex) beingVisited to false")
        vertex.beingVisited = false
        vertex.visited = true

    }
}
