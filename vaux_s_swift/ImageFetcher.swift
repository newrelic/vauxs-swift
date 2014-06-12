import Foundation
import UIKit

class ImageFetcher {
    var source: String
    var uiImage: UIImageView
    var data: NSMutableData
    let queue:NSOperationQueue = NSOperationQueue()

    init(source sourceUrl:String, forView imageView:UIImageView) {
        source = sourceUrl
        uiImage = imageView
        data = NSMutableData()
    }

    func run() {
        var timer = NRMethodTimer(methodName: "run", forObject: self, ofCategory: NRTraceTypeNetwork)

        var url: NSURL = NSURL(string: source)
        var request: NSURLRequest = NSURLRequest(URL: url)

        println("requesting \(source)")

        NSURLConnection.sendAsynchronousRequest(request, queue: queue,
            completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                self.data.appendData(data)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.finish()
                }
            })

        timer.exit()
    }

    func finish() {
        var timer = NRMethodTimer(methodName: "finish", forObject: self, ofCategory: NRTraceTypeViewLoading)

        uiImage.image = UIImage(data: self.data)

        timer.exit()
    }

}