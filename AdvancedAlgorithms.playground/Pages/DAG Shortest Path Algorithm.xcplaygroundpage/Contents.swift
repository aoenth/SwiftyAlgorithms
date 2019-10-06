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
    
    func addNeighbour(edge: Edge) {
        self.adjacenciesList.append(edge)
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}

extension Vertex: Equatable {
    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Edge {
    var weight: Double
    var startVertex: Vertex
    var targetVertex: Vertex
}

class TopologicalSort {
    var stack: Stack<Vertex>
    
    init() {
        self.stack = Stack<Vertex>()
    }
    
    func makeTopologicalOrder(vertexList: [Vertex]) {
        for vertex in vertexList {
            if !vertex.visited {
                dfs(vertex: vertex)
            }
        }
    }
    
    private func dfs(vertex: Vertex) {
        for edge in vertex.adjacenciesList {
            if !edge.targetVertex.visited {
                edge.targetVertex.visited = true
                dfs(vertex: edge.targetVertex)
            }
        }
        
        self.stack.push(vertex)
    }
    
    func getTopologicalOrder() -> Stack<Vertex> {
        print(self.stack)
        self.stack.reverse()
        print(self.stack)
        return self.stack
    }
}

func shortestPath(from sourceVertex: Vertex, to targetVertex: Vertex, with vertexList: [Vertex]) {
    sourceVertex.distance = 0
    let topologicalSort = TopologicalSort()
    topologicalSort.makeTopologicalOrder(vertexList: vertexList)
    
    /// This is weird, Sequence protocol gives a "reversed()" function for free? Seems inefficient, need refactoring from the future
    let stack = topologicalSort.getTopologicalOrder().reversed()
    
    for actualVertex in stack {
        print(actualVertex)
        for edge in actualVertex.adjacenciesList {
            let u = edge.startVertex
            let v = edge.targetVertex
            
            let newDistance = u.distance + edge.weight
            print(newDistance)
            
            if newDistance < v.distance {
                v.distance = newDistance
                v.predecessor = u
            }
        }
    }
    
    if targetVertex.distance == Double.greatestFiniteMagnitude {
        print("No path to go from start to end.")
    } else {
        print("Shortest path: \(targetVertex.distance)")
    }
}

func showShortestPath(to targetVertex: Vertex) {
    var vertices = [targetVertex]
    var actualVertex = targetVertex
    while let vertex = actualVertex.predecessor {
        vertices.append(vertex)
        actualVertex = vertex
    }
    vertices.reverse()
    print(vertices)
}

let vertex0 = Vertex(name: "A")
let vertex1 = Vertex(name: "B")
let vertex2 = Vertex(name: "C")

let vertexList = [vertex0, vertex1, vertex2]

vertex0.addNeighbour(edge: Edge(weight: 1, startVertex: vertex0, targetVertex: vertex1))
vertex0.addNeighbour(edge: Edge(weight: 10, startVertex: vertex0, targetVertex: vertex2))
vertex1.addNeighbour(edge: Edge(weight: 1, startVertex: vertex1, targetVertex: vertex2))

shortestPath(from: vertex0, to: vertex2, with: vertexList)
showShortestPath(to: vertex2)

