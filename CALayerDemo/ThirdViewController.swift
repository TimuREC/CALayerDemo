//
//  ThirdViewController.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 30.01.2021.
//

import UIKit

class ThirdViewController: UIViewController {

	var replicatorLayer: CAReplicatorLayer!
	var sourceLayer: CALayer!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        replicatorLayer = CAReplicatorLayer()
		sourceLayer = CALayer()
		
		self.view.layer.addSublayer(replicatorLayer)
		replicatorLayer.addSublayer(sourceLayer)
		
		
    }
	
	override func viewWillLayoutSubviews() {
		
		replicatorLayer.frame = self.view.bounds
		replicatorLayer.position = self.view.center
		
		sourceLayer.frame = CGRect(x: 0, y: 0, width: 3, height: 17)
		sourceLayer.backgroundColor = UIColor.white.cgColor
		sourceLayer.position = self.view.center
		sourceLayer.anchorPoint = CGPoint(x: 0.0, y: 5.0)
	}
	
	func startAnimation(delay: TimeInterval, replicates: Int) {
		
		replicatorLayer.instanceCount = replicates
		let angle = CGFloat(2.0 * .pi) / CGFloat(replicates)
		replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
		
		replicatorLayer.instanceDelay = delay
		
		sourceLayer.opacity = 0
		let opacityAnimation = CABasicAnimation(keyPath: "opacity")
		opacityAnimation.fromValue = 1
		opacityAnimation.toValue = 0
		opacityAnimation.duration = Double(replicates) * delay
		opacityAnimation.repeatCount = Float.infinity
		
		sourceLayer.add(opacityAnimation, forKey: nil)
	}
	
	@IBAction func buttonPressed(_ sender: Button) {
		startAnimation(delay: 0.1, replicates: 30)
	}
	

}
