import Foundation

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

    struct Edge {
        var weight: Double
        var startVertex: Vertex
        var targetVertex: Vertex
    }

    public class Vertex: CustomStringConvertible, Equatable {
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

        public var description: String {
            return self.name
        }

        public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
            return lhs.name == rhs.name
        }
    }
}

