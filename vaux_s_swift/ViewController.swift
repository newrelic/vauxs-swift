import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        NewRelic.startInteractionFromMethodName("viewDidLoad", object: self)

        super.viewDidLoad()

        self.loadImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadImages() {
        let timer = NRMethodTimer(methodName: "loadImages", forObject: self, ofCategory: NRTraceTypeViewLoading)

        for var i=0; i<4; i++ {
            let row:Int = i/2
            let col:Int = i%2

            let iView = UIImageView(frame: CGRectMake(CGFloat(row * 150 + 15), CGFloat(col * 150) + 30, 140, 140))
            iView.backgroundColor = UIColor.blackColor()
            self.view.addSubview(iView)

            let sourceUrl = "https://farm4.staticflickr.com/3843/14356460721_3a1bdf3b40_b.jpg"

            self.loadImage(source: sourceUrl, forView: iView)
        }

        timer.exit()
    }

    func loadImage(source imageSource:String, forView imageView:UIImageView) {
        let timer = NRMethodTimer(methodName: "loadImage", forObject: self, ofCategory: NRTraceTypeViewLoading)

        let loader = ImageFetcher(source: imageSource, forView: imageView)
        loader.run()
        
        timer.exit()
    }
}

