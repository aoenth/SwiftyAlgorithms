import XCTest
@testable import SwiftyAlgorithms

final class MapSolverTests: XCTestCase {
    func test() throws {
        var mazeSolver = MazeSolver(filename: "map", fileExtension: "txt", rows: 7, columns: 7)
        mazeSolver.solveMaze()
    }
}
