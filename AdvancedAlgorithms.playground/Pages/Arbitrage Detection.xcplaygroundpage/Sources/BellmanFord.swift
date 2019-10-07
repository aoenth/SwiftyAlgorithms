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
