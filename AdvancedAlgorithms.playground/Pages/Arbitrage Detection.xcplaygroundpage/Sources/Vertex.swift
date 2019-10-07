import Foundation

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
