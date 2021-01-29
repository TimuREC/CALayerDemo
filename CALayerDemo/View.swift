//
//  View.swift
//  CALayerDemo
//
//  Created by Timur Begishev on 30.01.2021.
//

import UIKit

@IBDesignable
class View: UIView {
	
	private var size = CGSize()
	@IBInspectable var cornerRadius: CGFloat = 30 {
		didSet {
			size = CGSize(width: cornerRadius, height: cornerRadius)
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: size).cgPath
		
		layer.mask = shapeLayer
	}
	
//	override class func prepareForInterfaceBuilder() {
//		setNeedsLayout()
//	}

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
