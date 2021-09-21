import XCTest
@testable import SwiftyAlgorithms

final class DepthFirstSearchTests: XCTestCase {
    func test() throws {
        let vertexList = [
            Vertex(name: "S"),
            Vertex(name: "A"),
            Vertex(name: "B"),
            Vertex(name: "C"),
            Vertex(name: "D"),
            Vertex(name: "E")
        ]

        let edgeList = [
            Edge(weight: -1, startVertex: vertexList[0], targetVertex: vertexList[1]),
            Edge(weight: -2, startVertex: vertexList[0], targetVertex: vertexList[3]),
            Edge(weight: -6, startVertex: vertexList[1], targetVertex: vertexList[2]),
            Edge(weight: -1, startVertex: vertexList[2], targetVertex: vertexList[4]),
            Edge(weight: -2, startVertex: vertexList[2], targetVertex: vertexList[5]),
            Edge(weight: -4, startVertex: vertexList[3], targetVertex: vertexList[1]),
            Edge(weight: -3, startVertex: vertexList[3], targetVertex: vertexList[4]),
            Edge(weight: -1, startVertex: vertexList[4], targetVertex: vertexList[5]),

        ]

        var bellmanFord = BellmanFord(edgeList: edgeList, vertexList: vertexList)
        bellmanFord.bellmanFord(sourceVertex: vertexList[0], targetVertex: vertexList[5])

    }
}
