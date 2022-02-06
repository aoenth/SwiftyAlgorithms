import Foundation

public enum MazeSolverOutcome: Error {
    case success
    case failure
}

public struct MazeSolver {
    private var startingPosition: (Int, Int)?
    private var map: [[Int]]
    private var visited: [[Bool]]
    
    public init(filename: String, fileExtension: String, rows: Int, columns: Int) {
        let fileReader = FileReader(filename: filename, fileExtension: fileExtension, rows: rows, columns: columns)
        
        self.startingPosition = fileReader.startingPosition
        self.visited = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)
        self.map = fileReader.map
    }
    
    public mutating func solveMaze() {
        guard let startingPosition = self.startingPosition else {
            return
        }
        do {
            try dfs(rowIndex: startingPosition.0, colIndex: startingPosition.1)
            throw MazeSolverOutcome.failure
        } catch let error {
            print(error)
        }
    }
    
    private mutating func dfs(rowIndex: Int, colIndex: Int) throws {
        print("Visiting \(rowIndex), \(colIndex), hitting \(map[rowIndex][colIndex])")
        if map[rowIndex][colIndex] == 3 {
            throw MazeSolverOutcome.success
        }
        
        let endOfMap = map.count - 1
        
        if visited[rowIndex][colIndex] {
            return
        } else if rowIndex < 0 || rowIndex > endOfMap {
            return
        } else if colIndex < 0 || colIndex > endOfMap {
            return
        } else if map[rowIndex][colIndex] == 1 {
            return
        } else {
            self.visited[rowIndex][colIndex] = true
            
            do {
                try dfs(rowIndex: rowIndex + 1, colIndex: colIndex) // go right
                try dfs(rowIndex: rowIndex, colIndex: colIndex + 1) // go down
                try dfs(rowIndex: rowIndex - 1, colIndex: colIndex) // go left
                try dfs(rowIndex: rowIndex, colIndex: colIndex - 1) // go up
            } catch let error {
                throw error
            }
            
        }
    }
}
