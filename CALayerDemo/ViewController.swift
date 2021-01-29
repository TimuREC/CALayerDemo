//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
	
	var gradientLayer: CAGradientLayer! {
		didSet {
			gradientLayer.startPoint = CGPoint(x: 0, y: 0)
			gradientLayer.endPoint = CGPoint(x: 0, y: 1)
			let startColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor
			let endColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor
			gradientLayer.colors = [startColor, endColor]
		}
	}

	@IBOutlet weak var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = imageView.frame.size.height / 2
			imageView.layer.masksToBounds = true
			let borderColor = UIColor.white
			imageView.layer.borderColor = borderColor.cgColor
			imageView.layer.borderWidth = 5
		}
	}
	
	@IBOutlet weak var button: UIButton! {
		didSet {
			button.layer.shadowOffset = CGSize(width: 0, height: 5)
			button.layer.shadowOpacity = 0.5
			button.layer.shadowRadius = 5
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

