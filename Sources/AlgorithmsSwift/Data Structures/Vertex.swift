import Foundation

public class Vertex: CustomStringConvertible {
    public var data: Int
    public var visited: Bool
    public var adjacenciesList: [Vertex]
    public var beingVisited: Bool
    
    public init(data: Int) {
        self.data = data
        self.visited = false
        self.beingVisited = false
        self.adjacenciesList = [Vertex]()
    }
    
    public func addNeighbourVertex(vertex: Vertex) {
        adjacenciesList.append(vertex)
    }
    
    public var description: String {
        return "Data: \(data), visited: \(visited)"
    }
}

extension Vertex: Equatable {
    public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}
