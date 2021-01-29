//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {

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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

