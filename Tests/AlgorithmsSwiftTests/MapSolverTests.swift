import XCTest
@testable import AlgorithmsSwift

final class MapSolverTests: XCTestCase {
    func test() throws {
        let url = try XCTUnwrap(Bundle.module.url(forResource: "map", withExtension: "txt"))
        let text = try String(contentsOf: url)
        let mazeMaker = MazeMaker(text: text, rows: 7, columns: 7)
        var mazeSolver = MazeSolver(
            map: mazeMaker.map,
            startingPosition: mazeMaker.startingPosition,
            rows: 7,
            columns: 7
        )
        mazeSolver.solveMaze()
    }
}
