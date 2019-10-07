import Foundation

public struct Edge {
    public var weight: Double
    public var startVertex: Vertex
    public var targetVertex: Vertex
    
    public init(weight: Double, startVertex: Vertex, targetVertex: Vertex) {
        self.weight = weight
        self.startVertex = startVertex
        self.targetVertex = targetVertex
    }
}
