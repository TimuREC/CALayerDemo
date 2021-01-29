//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 29.01.2021.
//

import UIKit

class SecondViewController: UIViewController {

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
			button.layer.shadowOffset = CGSize(width: 0, height: 10)
			button.layer.shadowOpacity = 0.7
			button.layer.shadowRadius = 10
			button.layer.shadowColor = UIColor.red.cgColor
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
