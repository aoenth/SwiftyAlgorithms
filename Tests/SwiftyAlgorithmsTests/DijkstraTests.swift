import XCTest
@testable import SwiftyAlgorithms

final class DijkstraTests: XCTestCase {
    func test() throws {
        var vertex0 = Vertex(name: "A")
        var vertex1 = Vertex(name: "B")
        var vertex2 = Vertex(name: "C")

        vertex0.addNeighbour(edge: Edge(weight: 1, startVertex: vertex0, targetVertex: vertex1))

        vertex0.addNeighbour(edge: Edge(weight: 3, startVertex: vertex0, targetVertex: vertex2))

        vertex1.addNeighbour(edge: Edge(weight: 1, startVertex: vertex1, targetVertex: vertex2))

        computePaths(sourceVertex: vertex0)

        print(getShortestPath(to: vertex2))
    }
}
