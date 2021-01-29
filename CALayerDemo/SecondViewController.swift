//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 29.01.2021.
//

import UIKit

class SecondViewController: UIViewController {
	
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
			imageView.layer.borderWidth = 10
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
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        gradientLayer = CAGradientLayer()
		view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
