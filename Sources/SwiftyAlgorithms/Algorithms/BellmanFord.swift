import Foundation

public struct BellmanFord {
    public var edgeList: [Edge]
    public var vertexList: [Vertex]
    public var cycleList: [Vertex]
    
    public init(edgeList: [Edge], vertexList: [Vertex]) {
        self.edgeList = edgeList
        self.vertexList = vertexList
        self.cycleList = [Vertex]()
    }
    
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
                    v.predecessor = edge.startVertex
                }
            }
        }
        
        for edge in edgeList {
            if edge.startVertex.distance != Double.greatestFiniteMagnitude {
                if hasCycle(edge: edge) {
                    
                    var vertex = edge.startVertex
                    
                    while vertex != edge.targetVertex {
                        self.cycleList.append(vertex)
                        if let pred = vertex.predecessor {
                            vertex = pred
                        } else {
                            break
                        }
                    }
                    
                    self.cycleList.append(edge.targetVertex)
                    return
                }
            }
        }
    }

    public mutating func bellmanFord(sourceVertex: Vertex, targetVertex: Vertex) {
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
                    v.predecessor = edge.startVertex
                }
            }
        }

        for edge in edgeList {
            if edge.startVertex.distance != Double.greatestFiniteMagnitude {
                if hasCycle(edge: edge) {
                    print("Negative cycle detected")
                    return
                }
            }
        }

        if targetVertex.distance != Double.greatestFiniteMagnitude {
            print("Shortest path from source to target found, with cost: \(targetVertex.distance)")
            var actualVertex = targetVertex
            var vertices = [actualVertex]
            while actualVertex.predecessor != nil {
                actualVertex = actualVertex.predecessor!
                vertices.append(actualVertex)
            }

            let path = vertices.reversed().map { "\($0)" }.joined(separator: " -> ")
            print(path)

        } else {
            print("No path found from source to target.")
        }

    }
    
    public func printCycle() {
        if !self.cycleList.isEmpty {
            print("Arbitrage opportunity detected")
            for vertex in self.cycleList {
                print(vertex)
            }
        } else {
            print("No arbitrage opportunity detected")
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
        
        while let previousVertex = actualVertex.predecessor {
            vertices.append(previousVertex)
            actualVertex = previousVertex
        }
        
        return vertices.reversed()
    }
}


extension BellmanFord {
    struct Edge {
        public var weight: Double
        public var startVertex: Vertex
        public var targetVertex: Vertex

        public init(weight: Double, startVertex: Vertex, targetVertex: Vertex) {
            self.weight = weight
            self.startVertex = startVertex
            self.targetVertex = targetVertex
        }
    }

    public class Vertex {
        public var name: String
        public var predecessor: Vertex?
        public var visited: Bool = false
        public var adjacenciesList = [Edge]()
        public var distance = Double.greatestFiniteMagnitude

        public init(name: String) {
            self.name = name
        }

        public func addNeighbour(edge: Edge) {
            self.adjacenciesList.append(edge)
        }
    }
}

extension BellmanFord.Vertex: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}

extension BellmanFord.Vertex: Equatable {
    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.name == rhs.name
    }
}
