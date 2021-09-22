import XCTest
@testable import SwiftyAlgorithms

final class DijkstraTests: XCTestCase {
    typealias Vertex = Dijkstra.Vertex
    typealias Edge = Dijkstra.Edge

    func test() throws {
        let vertex0 = Vertex(name: "A")
        let vertex1 = Vertex(name: "B")
        let vertex2 = Vertex(name: "C")

        vertex0.addNeighbour(edge: Edge(weight: 1, startVertex: vertex0, targetVertex: vertex1))

        vertex0.addNeighbour(edge: Edge(weight: 3, startVertex: vertex0, targetVertex: vertex2))

        vertex1.addNeighbour(edge: Edge(weight: 1, startVertex: vertex1, targetVertex: vertex2))

        Dijkstra.computePaths(sourceVertex: vertex0)

        print(Dijkstra.getShortestPath(to: vertex2))
    }
}
