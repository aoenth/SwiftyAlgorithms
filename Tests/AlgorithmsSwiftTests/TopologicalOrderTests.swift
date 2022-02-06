import XCTest
@testable import AlgorithmsSwift

final class TopologicalOrderTests: XCTestCase {
    func test() throws {
        let graph = [
            Vertex(data: 0),
            Vertex(data: 1),
            Vertex(data: 2),
            Vertex(data: 3),
            Vertex(data: 4),
            Vertex(data: 5)
        ]

        graph[2].addNeighbourVertex(vertex: graph[3])
        graph[3].addNeighbourVertex(vertex: graph[1])
        graph[4].addNeighbourVertex(vertex: graph[0])
        graph[4].addNeighbourVertex(vertex: graph[1])
        graph[5].addNeighbourVertex(vertex: graph[0])
        graph[5].addNeighbourVertex(vertex: graph[2])

        var topologicalOrdering = TopologicalOrdering()

        for i in 0..<graph.count {
            if !graph[i].visited {
                topologicalOrdering.dfs(vertex: graph[i])
            }
        }

        var stack = topologicalOrdering.getStack()

        for _ in 1...graph.count {
            if let vertex = stack.pop() {
                print(vertex)
            }
        }
    }
}
