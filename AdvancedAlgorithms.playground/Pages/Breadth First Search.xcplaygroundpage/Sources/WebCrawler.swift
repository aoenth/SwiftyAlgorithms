import Foundation

public class WebCrawler {
    private var queue: Queue<String>
    private var discoveredWebsitesList: [String]
    
    public init() {
        self.queue = Queue<String>()
        self.discoveredWebsitesList = [String]()
    }
    
    public func discoverWeb(root: String) {
        self.queue.enqueue(root)
        self.discoveredWebsitesList.append(root)
        let regexp = "http://(\\w+\\.)*(\\w+)"
        
        while(!queue.isEmpty()) {
            if let url = queue.dequeue() {
                let rawHtml = readURL(url: url)
                do {
                    let regex = try NSRegularExpression(pattern: regexp)
                    let results = regex.matches(in: rawHtml, range: NSRange(rawHtml.startIndex..., in: rawHtml))
                    
                    for result in results {
                        let foundUrl = String(rawHtml[Range(result.range, in: rawHtml)!])
                        
                        if (!discoveredWebsitesList.contains(foundUrl)) {
                            print(foundUrl)
                            queue.enqueue(foundUrl)
                            self.discoveredWebsitesList.append(foundUrl)
                        }
                        
                    }
                    
                } catch let error {
                    print("Invalid regex: \(error.localizedDescription)")
                }
            }
        }
        

    }
    
    private func readURL(url: String) -> String {
        guard let urlString = URL(string: url) else {
            print("Error: \(url) doesn't seem to be a valid URL")
            return ""
        }
        
        var rawHtml = ""
        
        do {
            rawHtml = try String(contentsOf: urlString, encoding: .ascii)
//            print("HTML: \(rawHtml)")
        } catch let error {
            print("Error: \(error)")
        }
        
        return rawHtml
    }
}
