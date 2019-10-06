//: [Previous](@previous)

import Foundation

public class Vertex {
    public var name: String
    public var visited = false
    public var distance = Double.greatestFiniteMagnitude
    public var previousVertex: Vertex?
    public var adjacencies: [Edge]
    
    public init(name: String) {
        self.name = name
        self.adjacencies = [Edge]()
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}

public struct Edge {
    public var weight: Double
    public var startVertex: Vertex
    public var targetVertex: Vertex
}

public struct BellmanFord {
    public var edgeList: [Edge]
    public var vertexList: [Vertex]
    
    
    public mutating func bellmanFord(sourceVertex: Vertex) {
        let sourceVertex = sourceVertex
        
        sourceVertex.distance = 0;
        
        for _ in 0 ..< vertexList.count - 1 {
            for edge in edgeList {
                
                let u = edge.startVertex
                let v = edge.targetVertex
                
                if u.distance == Double.greatestFiniteMagnitude {
                    continue
                }
                
                let newDistance = u.distance + edge.weight
                
                if newDistance < v.distance {
                    v.distance = newDistance
                    v.previousVertex = edge.startVertex
                }
            }
        }
        
        for edge in edgeList {
            if edge.startVertex.distance != Double.greatestFiniteMagnitude {
                if hasCycle(edge: edge) {
                    print("Negative Cycle detected")
                    return
                }
            }
        }
    }
    
    private func hasCycle(edge: Edge) -> Bool {
        return edge.startVertex.distance + edge.weight < edge.targetVertex.distance
    }
    
    public func shortestPathTo(targetVertex: Vertex) -> [Vertex] {
        if targetVertex.distance == Double.greatestFiniteMagnitude {
            print("There is no path from the source to the target")
        } else {
            print("There is a shortest path from source to target, with cost \(targetVertex.distance)")
        }
        
        var actualVertex = targetVertex
        var vertices = [actualVertex]
        
        while let previousVertex = actualVertex.previousVertex {
            vertices.append(previousVertex)
            actualVertex = previousVertex
        }
        
        return vertices.reversed()
    }
}

let vertexList = [
    Vertex(name: "A"),
    Vertex(name: "B"),
    Vertex(name: "C")
]

let edgeList = [
    Edge(weight: 1, startVertex: vertexList[0], targetVertex: vertexList[1]),
    Edge(weight: -1, startVertex: vertexList[0], targetVertex: vertexList[2]),
    Edge(weight: -1.21, startVertex: vertexList[1], targetVertex: vertexList[0])
]


var bellmanFord = BellmanFord(edgeList: edgeList, vertexList: vertexList)
bellmanFord.bellmanFord(sourceVertex: vertexList[0])
for v in bellmanFord.shortestPathTo(targetVertex: vertexList[2]) {
    print(v, separator: "", terminator: " - ")
}

