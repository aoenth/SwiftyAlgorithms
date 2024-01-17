import Foundation

public class TrieNode {

    public init(value: Character) {
        self.value = value
    }

    public init(string: String) {
        let array = Array(string)
        self.value = array[0]
        add(Array(array.dropFirst()))
    }

    public let value: Character

    public var children = [TrieNode]()

    public func add(string: String) {
        add(Array(string))
    }

    private func add(_ array: [Character]) {
        guard let first = array.first else { return }
        for child in children {
            if child.value == first {
                child.add(Array(array.dropFirst()))
                return
            }
        }
        let newChild = TrieNode(value: first)
        children.append(newChild)
        add(array)
    }

    public func contains(string: String) -> Bool {
        contains(array: Array(string))
    }

    public func contains(array: [Character]) -> Bool {
        guard !array.isEmpty else { return true }
        guard array[0] == value else { return false }

        let next = array.dropFirst()

        guard !next.isEmpty else { return true }

        for child in children {
            if child.contains(array: Array(next)) {
                return true
            }
        }
        return false
    }
}
