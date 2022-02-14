import XCTest
@testable import AlgorithmsSwift

final class BellmanFordTests: XCTestCase {
    typealias Vertex = BellmanFord.Vertex
    typealias Edge = BellmanFord.Edge

    func test() throws {
        let vertexList = [
            Vertex(name: "A"),
            Vertex(name: "B"),
            Vertex(name: "C")
        ]

        let edgeList = [
            Edge(weight: 1, startVertex: vertexList[0], targetVertex: vertexList[1]),
            Edge(weight: -1, startVertex: vertexList[0], targetVertex: vertexList[2]),
            Edge(weight: -1.21, startVertex: vertexList[1], targetVertex: vertexList[0])
        ]

        var bellmanFord = BellmanFord(edgeList: edgeList, vertexList: vertexList)
        bellmanFord.bellmanFord(sourceVertex: vertexList[0])
        for v in bellmanFord.shortestPathTo(targetVertex: vertexList[2]) {
            print(v, separator: "", terminator: " - ")
        }
    }
}
