import XCTest
@testable import SwiftyAlgorithms

final class DepthFirstSearchTests: XCTestCase {
    typealias Vertex = DepthFirstSearch.Vertex

    func test() throws {
        let v1 = Vertex(data: 1)
        let v2 = Vertex(data: 2)
        let v3 = Vertex(data: 3)
        let v4 = Vertex(data: 4)
        let v5 = Vertex(data: 5)

        v1.addNeighbourVertex(vertex: v2)
        v1.addNeighbourVertex(vertex: v3)
        v3.addNeighbourVertex(vertex: v4)
        v4.addNeighbourVertex(vertex: v5)

        let list = [v1, v2, v3, v4, v5]

        let dfs = DepthFirstSearch()
        dfs.dfs(vertexList: list)
    }
}
