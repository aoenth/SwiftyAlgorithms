import XCTest
@testable import AlgorithmsSwift

final class BreadthFirstSearchTests: XCTestCase {
    func test() throws {
        let bfs = BreadthFirstSearchSpy()

        let vertex1 = Vertex(data: 1)
        let vertex2 = Vertex(data: 2)
        let vertex3 = Vertex(data: 3)
        let vertex4 = Vertex(data: 4)
        let vertex5 = Vertex(data: 5)

        vertex1.addNeighbourVertex(vertex: vertex2)
        vertex1.addNeighbourVertex(vertex: vertex4)
        vertex4.addNeighbourVertex(vertex: vertex5)
        vertex2.addNeighbourVertex(vertex: vertex3)


        bfs.bfs(root: vertex1)

        let expected = [
            vertex1,
            vertex2,
            vertex4,
            vertex3,
            vertex5
        ]
        XCTAssertEqual(bfs.visitations, expected)
    }

    final class BreadthFirstSearchSpy: BreadthFirstSearch {
        var visitations: [Vertex] = []

        override func bfs(root: Vertex, onVisit: (Vertex) -> Void = { _ in }) {
            super.bfs(root: root) { visitations.append($0) }
        }
    }
}
