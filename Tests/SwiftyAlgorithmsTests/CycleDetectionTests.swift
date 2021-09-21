import XCTest
@testable import SwiftyAlgorithms

final class CycleDetectionTests: XCTestCase {
    func test() throws {
        let graph = [
            Vertex(data: 1),
            Vertex(data: 2),
            Vertex(data: 3),
            Vertex(data: 4),
            Vertex(data: 5),
            Vertex(data: 6)
        ]

        graph[0].addNeighbourVertex(vertex: graph[1])
        graph[0].addNeighbourVertex(vertex: graph[2])
        graph[2].addNeighbourVertex(vertex: graph[0])
        graph[3].addNeighbourVertex(vertex: graph[0])
        graph[3].addNeighbourVertex(vertex: graph[4])
        graph[4].addNeighbourVertex(vertex: graph[5])
        graph[5].addNeighbourVertex(vertex: graph[3])

        let cycleDetection = CycleDetection()

        cycleDetection.detectCycle(vertexList: graph)
    }
}
