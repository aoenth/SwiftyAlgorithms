import Foundation

public struct FileReader {
    public var map: [[Int]]
    public var startingPosition: (Int, Int)?

    public init(filename: String, fileExtension: String, rows: Int, columns: Int) {
        var text = ""
        
        do {
            guard let fileUrl = Bundle.main.url(forResource: "map", withExtension: "txt") else { fatalError() }
            text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }

        // Generate Map
        let rowsOfText = text.split { $0.isNewline }
        var map = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
        // Find starting position
        var startingPosition: (Int, Int)?

        for i in 0..<rowsOfText.count {
            let columns = rowsOfText[i].split { $0.isWhitespace }
            for j in 0..<columns.count {
                if let foundInt = Int(String(columns[j])) {
                    map[i][j] = foundInt
                    if foundInt == 2 {
                        startingPosition = (i, j)
                    }
                }
            }
        }

        self.map = map
        if let sp = startingPosition {
            self.startingPosition = sp
        }
    }
}
