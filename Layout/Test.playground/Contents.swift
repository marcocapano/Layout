//: A UIKit based Playground for presenting user interface
  
import UIKit
import Layout
import PlaygroundSupport

NSSetUncaughtExceptionHandler { (error) in
    print(error)
}

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Hello World!Hello World!Hello World!Hello World!"
        
        let rect = UIView()
        rect.backgroundColor = .yellow
        view.addSubview(rect)

        rect.layout {
            $0.width == view.widthAnchor
            $0.height == view.heightAnchor/3
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
        }
        
        rect.addSubview(label)
        label.layout {
            $0.width == rect.widthAnchor*0.75
            $0.centerX == rect.centerXAnchor
            $0.centerY == rect.centerYAnchor
        }
        
        let line = UIView()
        line.backgroundColor = .blue
        rect.addSubview(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.layoutProxy.centerX == rect.centerXAnchor
        line.layoutProxy.centerY == rect.centerYAnchor - 50
        line.layoutProxy.height == 20
        line.layoutProxy.width.equal(to: 100)
        
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
