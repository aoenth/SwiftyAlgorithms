import XCTest
@testable import AlgorithmsSwift

final class ArbitrageDetectionTests: XCTestCase {
    typealias Vertex = BellmanFord.Vertex
    typealias Edge = BellmanFord.Edge

    func test() throws {

        let vertexList = [
            Vertex(name: "USD"),
            Vertex(name: "EUR"),
            Vertex(name: "GBP"),
            Vertex(name: "CHF"),
            Vertex(name: "CAD")
        ]

        let edgeList = [
            Edge(weight: -1 * log(0.741), startVertex: vertexList[0], targetVertex: vertexList[1]),
            Edge(weight: -1 * log(0.657), startVertex: vertexList[0], targetVertex: vertexList[2]),
            Edge(weight: -1 * log(1.061), startVertex: vertexList[0], targetVertex: vertexList[3]),
            Edge(weight: -1 * log(1.005), startVertex: vertexList[0], targetVertex: vertexList[4]),

            Edge(weight: -1 * log(1.349), startVertex: vertexList[1], targetVertex: vertexList[0]),
            Edge(weight: -1 * log(0.888), startVertex: vertexList[1], targetVertex: vertexList[2]),
            Edge(weight: -1 * log(1.433), startVertex: vertexList[1], targetVertex: vertexList[3]),
            Edge(weight: -1 * log(1.366), startVertex: vertexList[1], targetVertex: vertexList[4]),

            Edge(weight: -1 * log(1.521), startVertex: vertexList[2], targetVertex: vertexList[0]),
            Edge(weight: -1 * log(1.126), startVertex: vertexList[2], targetVertex: vertexList[1]),
            Edge(weight: -1 * log(1.614), startVertex: vertexList[2], targetVertex: vertexList[3]),
            Edge(weight: -1 * log(1.538), startVertex: vertexList[2], targetVertex: vertexList[4]),

            Edge(weight: -1 * log(0.942), startVertex: vertexList[3], targetVertex: vertexList[0]),
            Edge(weight: -1 * log(0.698), startVertex: vertexList[3], targetVertex: vertexList[1]),
            Edge(weight: -1 * log(0.619), startVertex: vertexList[3], targetVertex: vertexList[2]),
            Edge(weight: -1 * log(0.953), startVertex: vertexList[3], targetVertex: vertexList[4]),

            Edge(weight: -1 * log(0.995), startVertex: vertexList[4], targetVertex: vertexList[0]),
            Edge(weight: -1 * log(0.732), startVertex: vertexList[4], targetVertex: vertexList[1]),
            Edge(weight: -1 * log(0.650), startVertex: vertexList[4], targetVertex: vertexList[2]),
            Edge(weight: -1 * log(1.049), startVertex: vertexList[4], targetVertex: vertexList[3])
        ]

        var bellmanFord = BellmanFord(edgeList: edgeList, vertexList: vertexList)
        bellmanFord.bellmanFord(sourceVertex: vertexList[0])

        bellmanFord.printCycle()
    }
}
