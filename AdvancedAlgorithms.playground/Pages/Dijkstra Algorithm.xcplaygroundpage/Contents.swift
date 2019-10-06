//: [Previous](@previous)

import Foundation

public class Vertex {
    public var name: String
    public var adjacenciesList: [Edge]
    public var visited: Bool = false
    public var predecessor: Vertex?
    public var distance: Double = Double.greatestFiniteMagnitude
    
    public init(name: String) {
        self.name = name
        self.adjacenciesList = [Edge]()
    }
    
    public func addNeighbour(edge: Edge) {
        self.adjacenciesList.append(edge)
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return self.name;
    }
}

extension Vertex: Comparable {
    public static func < (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.distance < rhs.distance
    }
    
    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.distance == rhs.distance
    }
}

public struct Edge {
    public var weight: Double
    public var startVertex: Vertex
    public var targetVertex: Vertex
}

public func computePaths(sourceVertex: Vertex) {
    sourceVertex.distance = 0
    var priorityQueue = Heap<Vertex>(priorityFunction: <)
    
    priorityQueue.enqueue(sourceVertex)
    
    while (!priorityQueue.isEmpty) {
        if let actualVertex = priorityQueue.dequeue() {
            for edge in actualVertex.adjacenciesList {
                let vertex = edge.targetVertex
                
                let newDistance = actualVertex.distance + edge.weight
                
                if newDistance < vertex.distance {
                    priorityQueue.remove(vertex)
                    vertex.distance = newDistance
                    vertex.predecessor = actualVertex
                    priorityQueue.enqueue(vertex)
                }
                
            }
        }
    }
}

public func getShortestPath(to targetVertex: Vertex) -> [Vertex] {
    var shortestPathToTarget = [targetVertex]
    var targetVertex = targetVertex
    
    while let target = targetVertex.predecessor {
        shortestPathToTarget.append(target)
        targetVertex = target
    }
    
    return shortestPathToTarget.reversed()
    
}


var vertex0 = Vertex(name: "A")
var vertex1 = Vertex(name: "B")
var vertex2 = Vertex(name: "C")

vertex0.addNeighbour(edge: Edge(weight: 1, startVertex: vertex0, targetVertex: vertex1))

vertex0.addNeighbour(edge: Edge(weight: 3, startVertex: vertex0, targetVertex: vertex2))

vertex1.addNeighbour(edge: Edge(weight: 1, startVertex: vertex1, targetVertex: vertex2))

computePaths(sourceVertex: vertex0)

print(getShortestPath(to: vertex2))
