//: # ButtonShield
//: A demo playground that demonstrates how to use Core Animation layers
//: to create a fun button, shamelessly stolen from ExpressVPN
//: > Icons made by [Icon Works](https://www.flaticon.com/authors/icon-works) from [www.flaticon.com](https://www.flaticon.com/) is licensed by [CC 3.0 BY](http://creativecommons.org/licenses/by/3.0/)

import UIKit
import PlaygroundSupport

//: ### Extensions to store constants

fileprivate extension CGFloat {
  static var outerCircleRatio: CGFloat = 0.8
  static var innerCircleRatio: CGFloat = 0.55
  static var inProgressRatio: CGFloat = 0.58
}

fileprivate extension Double {
  static var animationDuration: Double = 0.5
  static var inProgressPeriod: Double = 2.0
}


//: ### The main ButtonView class

class ButtonView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayers()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayers()
    }

    private func configureLayers() {
        backgroundColor = #colorLiteral(red: 0.9600390625, green: 0.9600390625, blue: 0.9600390625, alpha: 1)
        // TODO
    }

    private lazy var greenBackground: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        return layer
    }()

    private lazy var inProgressLayer: CAGradientLayer = {
        let layer = CAGradientLayer()

        return layer
    }

    private lazy var badgeLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [] as [CGColor]
        layer.frame = layer.bounds
        layer.applyPopShadow()
        layer.

        return layer
    }()

    private func createBadgeLayerMask() -> CAShapeLayer {
        let scale = layer.bounds.width / UIBezierPath.badgePath.bounds.width
        let mask = CAShapeLayer()
        mask.path = UIBezierPath.badgePath.cgPath
        mask.transform = CATransform3DMakeScale(scale, scale, 1)
        return mask
    }
}

//: ### Present the button

let aspectRatio = UIBezierPath.badgePath.bounds.width / UIBezierPath.badgePath.bounds.height
let button = ButtonView(frame: CGRect(x: 0, y: 0, width: 300, height: 300 / aspectRatio))

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = button

let connection = PseudoConnection { (state) in
  switch state {
  case .disconnected:
    print("Disconnected")
  case .connecting:
    print("Connecting")
  case .connected:
    print("Connected")
  }
}

let gesture = UITapGestureRecognizer(target: connection, action: #selector(PseudoConnection.toggle))
button.addGestureRecognizer(gesture)
