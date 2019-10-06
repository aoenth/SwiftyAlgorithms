//: [Previous](@previous)

import Foundation
/**
Dijkstra: O(E*V), no negative edge weight support
Bellman-Ford: (E+V*logV), negative edge weight support
DAG shortest path method: O(E+V)
 */

class Vertex {
    var name: String
    var predecessor: Vertex?
    var visited: Bool = false
    var adjacenciesList = [Edge]()
    var distance = Double.greatestFiniteMagnitude
    
    init(name: String) {
        self.name = name
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}

struct Edge {
    var weight: Double
    var startVertex: Vertex
    var targetVertex: Vertex
}

//class TopologicalSort {
//    var stack: Stack<Vertex>
//    
//    init() {
//        self.stack = Stack<Vertex>()
//    }
//    
//    func makeTopologicalOrder(vertexList: [Vertex]) {
//        for vertex in vertexList {
//            if !vertex.visited {
//                dfs(vertex: vertex)
//            }
//        }
//    }
//    
//    private func dfs(vertex: Vertex) {
//        for edge in vertex.adjacenciesList {
//            if !edge.targetVertex.visited {
//                edge.targetVertex.visited = true
//                dfs(vertex: edge.targetVertex)
//            }
//        }
//        
//        self.stack.push(vertex)
//    }
//    
////    func getTopologicalOrder() -> Stack<Vertex> {
////        self.stack.
////
////    }
//}
