import Foundation

var bfs = BreadthFirstSearch()

var vertex1 = Vertex(data: 1)
var vertex2 = Vertex(data: 2)
var vertex3 = Vertex(data: 3)
var vertex4 = Vertex(data: 4)
var vertex5 = Vertex(data: 5)

vertex1.addNeighbourVertex(vertex: vertex2)
vertex1.addNeighbourVertex(vertex: vertex4)
vertex4.addNeighbourVertex(vertex: vertex5)
vertex2.addNeighbourVertex(vertex: vertex3)


bfs.bfs(root: vertex1)

WebCrawler().discoverWeb(root: "http://www.bbc.com/")

//: [Next](@next)
