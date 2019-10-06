//: [Previous](@previous)

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

var graph = [
    Vertex(data: 1),
    Vertex(data: 2),
    Vertex(data: 3),
    Vertex(data: 4),
    Vertex(data: 5),
    Vertex(data: 6)
]

graph[0].addNeighbourVertex(vertex: graph[1])
graph[0].addNeighbourVertex(vertex: graph[2])
graph[2].addNeighbourVertex(vertex: graph[0])
graph[3].addNeighbourVertex(vertex: graph[0])
graph[3].addNeighbourVertex(vertex: graph[4])
graph[4].addNeighbourVertex(vertex: graph[5])
graph[5].addNeighbourVertex(vertex: graph[3])

var cycleDetection = CycleDetection()

cycleDetection.detectCycle(vertexList: graph)

