//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 29.01.2021.
//

import UIKit

class SecondViewController: UIViewController {
	
	var shapeLayer: CAShapeLayer! {
		didSet {
			shapeLayer.lineWidth = 10
			shapeLayer.lineCap = .round
			shapeLayer.fillColor = nil
			shapeLayer.strokeColor = UIColor.white.cgColor
			shapeLayer.strokeEnd = 0
			let rotation = CATransform3DMakeRotation(CGFloat(90.0 * .pi / 180.0), 0, 0, 1)
			shapeLayer.transform = CATransform3DTranslate(rotation, 0, 0, 1)
			
		}
	}
	
	var gradientLayer: CAGradientLayer! {
		didSet {
			gradientLayer.startPoint = CGPoint(x: 1, y: 0)
			gradientLayer.endPoint = CGPoint(x: 0.2, y: 1)
			let startColor = UIColor.red.cgColor
			let endColor = UIColor.blue.cgColor
			gradientLayer.colors = [startColor, endColor]
			gradientLayer.locations = [0.1, 0.6]
		}
	}

	@IBOutlet weak var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = imageView.frame.size.height / 2
			imageView.layer.masksToBounds = true
			imageView.layer.borderColor = UIColor.lightGray.cgColor
			imageView.layer.borderWidth = 5
		}
	}
	@IBOutlet weak var button: UIButton! {
		didSet {
			button.layer.shadowOffset = CGSize(width: -5, height: 5)
			button.layer.shadowOpacity = 0.7
			button.layer.shadowRadius = 10
			button.layer.shadowColor = UIColor.red.cgColor
		}
	}
	
	override func viewDidLayoutSubviews() {
		gradientLayer.frame = CGRect(x: 0, y: 0,
									 width: self.view.frame.size.width,
									 height: self.view.frame.size.height)
		
		shapeLayer.frame = view.bounds
		let path = UIBezierPath(roundedRect: imageView.frame, cornerRadius: imageView.frame.size.width / 2)
		shapeLayer.path = path.cgPath
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        gradientLayer = CAGradientLayer()
		view.layer.insertSublayer(gradientLayer, at: 0)
		
		shapeLayer = CAShapeLayer()
		view.layer.addSublayer(shapeLayer)
    }
	
	@IBAction func buttonTapped(_ sender: UIButton) {
		let animation = CABasicAnimation(keyPath: "strokeEnd")
		animation.toValue = 1
		animation.duration = 3
		animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
		animation.fillMode = .both
		animation.isRemovedOnCompletion = false
		animation.delegate = self
		
		shapeLayer.add(animation, forKey: nil)
	}
	
}

extension SecondViewController: CAAnimationDelegate {
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		performSegue(withIdentifier: "showThirdScreen", sender: self)
	}
}
