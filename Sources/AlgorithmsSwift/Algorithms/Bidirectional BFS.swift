//
//  Bidirectional BFS.swift
//
//
//  Created by Kevin Peng on 2022-02-05.
//

import Foundation

/*
 From Cracking the Coding Interview, chapter 9 question 2.
 */
class PathNode {

    let person: Person
    private let previousNode: PathNode?

    init(person: Person, previousNode: PathNode?) {
        self.person = person
        self.previousNode = previousNode
    }

    func collapse(startsWithRoot: Bool) -> LinkedList<Person> {
        var path = LinkedList<Person>()
        var node: PathNode? = self
        while let n = node {
            if startsWithRoot {
                path.append(value: n.person)
            } else {
                path.addFirst(value: n.person)
            }
            node = n.previousNode
        }
        return path
    }
}

class BFSData {
    var toVisit = Queue<PathNode>()
    var visited = [Int: PathNode]()

    init(root: Person) {
        let sourcePath = PathNode(person: root, previousNode: nil)
        toVisit.enqueue(sourcePath)
        visited[root.id] = sourcePath
    }

    var isFinished: Bool {
        toVisit.isEmpty()
    }
}

public class Person: CustomStringConvertible, Equatable {
    public let id: Int
    private(set) var friendIDs: [Int] = []

    public init(id: Int) {
        self.id = id
    }

    public func addFriend(_ friend: Person) {
        guard friendIDs.contains(friend.id) == false else { return }
        friendIDs.append(friend.id)
        friend.addFriend(self)
    }

    public var description: String {
        let friends = friendIDs.map(String.init).joined(separator: ", ")
        return "Person \(id)" + ", friends: " + friends
    }

    public static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}

func mergePaths(bfs1: BFSData, bfs2: BFSData, connection: Int) -> LinkedList<Person> {
    let end1 = bfs1.visited[connection] // end 1 -> source
    let end2 = bfs2.visited[connection] // end 2 -> source
    var pathOne = end1?.collapse(startsWithRoot: false)
    var pathTwo = end2?.collapse(startsWithRoot: true) // reverse
    pathTwo?.removeFirst()
    if let pathTwo = pathTwo {
        pathOne?.addAll(pathTwo)
    }
    return pathOne ?? LinkedList<Person>()
}

func searchLevel(people: [Int: Person], primary: BFSData, secondary: BFSData) -> Person? {
    let count = primary.toVisit.count
    for _ in 0 ..< count {
        guard let pathNode = primary.toVisit.dequeue() else { return nil }
        let personID = pathNode.person.id

        if let visitedPathNode = secondary.visited[personID] {
            return visitedPathNode.person
        }

        let person = pathNode.person
        let friendIDs = person.friendIDs

        for friendID in friendIDs {
            if nil == primary.visited[friendID] {
                guard let unvisitedFriend = people[friendID] else { return nil }
                let next = PathNode(person: unvisitedFriend, previousNode: pathNode)
                primary.visited[friendID] = next
                primary.toVisit.enqueue(next)
            }
        }
    }
    return nil
}

public func findPathBiBFS(people: [Int: Person], source: Int, destination: Int) -> LinkedList<Person>? {
    guard let sourcePerson = people[source], let destinationPerson = people[destination] else { return nil }
    let sourceData = BFSData(root: sourcePerson)
    let destinationData = BFSData(root: destinationPerson)

    while !sourceData.isFinished, !destinationData.isFinished {
        var collision = searchLevel(people: people, primary: sourceData, secondary: destinationData)

        if let collision = collision {
            return mergePaths(bfs1: sourceData, bfs2: destinationData, connection: collision.id)
        }

        collision = searchLevel(people: people, primary: destinationData, secondary: sourceData)

        if let collision = collision {
            return mergePaths(bfs1: sourceData, bfs2: destinationData, connection: collision.id)
        }
    }
    return nil
}
