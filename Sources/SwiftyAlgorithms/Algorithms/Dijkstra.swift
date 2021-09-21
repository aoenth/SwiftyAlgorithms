
import Foundation

public struct Dijkstra {
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
}

extension Dijkstra.Vertex: CustomStringConvertible {
    public var description: String {
        return self.name;
    }
}

extension Dijkstra.Vertex: Comparable {
    public static func < (lhs: Dijkstra.Vertex, rhs: Dijkstra.Vertex) -> Bool {
        return lhs.distance < rhs.distance
    }

    public static func == (lhs: Dijkstra.Vertex, rhs: Dijkstra.Vertex) -> Bool {
        return lhs.distance == rhs.distance
    }
}
