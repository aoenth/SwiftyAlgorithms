import XCTest
@testable import SwiftyAlgorithms

final class DepthFirstSearchTests: XCTestCase {
    func test() throws {
        var v1 = Vertex(data: 1)
        var v2 = Vertex(data: 2)
        var v3 = Vertex(data: 3)
        var v4 = Vertex(data: 4)
        var v5 = Vertex(data: 5)

        v1.addNeighbourVertex(vertex: v2)
        v1.addNeighbourVertex(vertex: v3)
        v3.addNeighbourVertex(vertex: v4)
        v4.addNeighbourVertex(vertex: v5)

        var list = [v1, v2, v3, v4, v5]

        var dfs = DepthFirstSearch()
        dfs.dfs(vertexList: list)
    }
}
