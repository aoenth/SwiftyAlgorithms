import XCTest
@testable import SwiftyAlgorithms

final class DepthFirstSearchTests: XCTestCase {
    typealias Vertex = DepthFirstSearch.Vertex

    func test_dfs_stackImplementation() throws {
        let v1 = Vertex(data: 1)
        let v2 = Vertex(data: 2)
        let v3 = Vertex(data: 3)
        let v4 = Vertex(data: 4)
        let v5 = Vertex(data: 5)
        let v6 = Vertex(data: 6)

        v1.addNeighbourVertex(vertex: v2)
        v2.addNeighbourVertex(vertex: v6)
        v1.addNeighbourVertex(vertex: v3)
        v3.addNeighbourVertex(vertex: v4)
        v4.addNeighbourVertex(vertex: v5)

        let list = [v1, v2, v3, v4, v5]
        let sut = makeSUT(vertextList: list, strategy: .stack)

        let visitOrder  = [v1, v3, v4, v5, v2, v6]
        XCTAssertEqual(visitOrder, sut.visitations)

    }

    func test_dfs_recursiveImplementation() throws {
        let v1 = Vertex(data: 1)
        let v2 = Vertex(data: 2)
        let v3 = Vertex(data: 3)
        let v4 = Vertex(data: 4)
        let v5 = Vertex(data: 5)
        let v6 = Vertex(data: 6)

        v1.addNeighbourVertex(vertex: v2)
        v2.addNeighbourVertex(vertex: v6)
        v1.addNeighbourVertex(vertex: v3)
        v3.addNeighbourVertex(vertex: v4)
        v4.addNeighbourVertex(vertex: v5)

        let list = [v1, v2, v3, v4, v5]
        let sut = makeSUT(vertextList: list, strategy: .recurse)

        let visitOrder  = [v1, v2, v6, v3, v4, v5]
        XCTAssertEqual(visitOrder, sut.visitations)
    }

    // MARK: - Helpers

    private func makeSUT(
        vertextList: [Vertex],
        strategy: DepthFirstSearch.Implementation
    ) -> DepthFirstSearchSpy {
        let dfs = DepthFirstSearchSpy()
        dfs.dfs(vertexList: vertextList, strategy: strategy)
        return dfs
    }

    private final class DepthFirstSearchSpy: DepthFirstSearch {
        var visitations: [Vertex] = []

        override func dfs(
            vertexList: [Vertex],
            strategy: Implementation,
            onVisit: (Vertex) -> Void = { _ in }
        ) {
            super.dfs(
                vertexList: vertexList,
                strategy: strategy
            ) {
                visitations.append($0)
                print("visited \($0)")
            }
        }
    }
}
