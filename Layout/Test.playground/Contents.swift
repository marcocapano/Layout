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
        
        let content = UIView()
        content.backgroundColor = .green
        view.addSubview(content)
        
        content.box(in: view, edges: UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8))
        
        let rect = UIView()
        rect.backgroundColor = .yellow
        content.addSubview(rect)

        rect.layout {
            $0.width == content.widthAnchor
            $0.height == content.heightAnchor/3
            $0.centerX == content.centerXAnchor
            $0.centerY == content.centerYAnchor
        }
        
        rect.addSubview(label)
        label.layout {
            $0.width == rect.widthAnchor*0.75
            $0.centerX == rect.centerXAnchor
            $0.centerY == rect.centerYAnchor + 50
        }
        
        label.layout {
            $0.width.equal(to: view.widthAnchor, multiplier: 0.5)
            $0.centerX.equal(to: view.centerXAnchor, offsetBy: 16)
            $0.centerY.equal(to: view.centerYAnchor)
        }
        
        let line = UIView()
        line.backgroundColor = .blue
        rect.addSubview(line)
        
        line.constraintSize(width: 100, height: 20)
        line.center(in: rect)
        
        self.view = view        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
