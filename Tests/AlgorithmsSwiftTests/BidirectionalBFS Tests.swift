//
//  BidirectionalBFSTests.swift
//  
//
//  Created by Kevin Peng on 2022-02-05.
//

import XCTest
import AlgorithmsSwift


final class BidirectionalBFSTests: XCTestCase {
    //       1  ───────────   2   ─────────── 6
    //
    //                        │
    //                        │
    //
    //       3  ───────────   4  ──────────── 5
    //
    //       │                                │
    //       │                                │
    //       │                                │
    //       └────────────────────────────────┘
    func test() throws {
        let p1 = Person(id: 1)
        let p2 = Person(id: 2)
        let p3 = Person(id: 3)
        let p4 = Person(id: 4)
        let p5 = Person(id: 5)
        let p6 = Person(id: 6)

        p1.addFriend(p2)
        p2.addFriend(p4)
        p2.addFriend(p6)
        p4.addFriend(p3)
        p4.addFriend(p5)
        p3.addFriend(p5)

        let people = [p1, p2, p3, p4, p5, p6].reduce(into: [Int: Person]()) { $0[$1.id] = $1 }

        let result = findPathBiBFS(people: people, source: 1, destination: 5)
        let path = try XCTUnwrap(result)

        var expected = LinkedList<Person>()
        expected.append(value: p1)
        expected.append(value: p2)
        expected.append(value: p4)
        expected.append(value: p5)

        XCTAssertEqual(path, expected)
        XCTAssertEqual(path.description, expected.description)
    }
}
