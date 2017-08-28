//
//  Extensions.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension UIColor {
	convenience public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
		self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
		
	}
	
	class func cellBackground(a: CGFloat) -> UIColor {
		return UIColor(r: 58, g: 158, b: 216, a: a)
	}
	
}

extension UIView {
	
	public func addSubViews(views: UIView...) {
		views.forEach{addSubview($0)}
	}
	
	public func noAutoResizeMask(views: UIView...) {
		views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
	}
	
	public func addConstraintsWithFormat(_ format: String, views: UIView...) {
		
		var viewsDictionary = [String: UIView]()
		for (index, view) in views.enumerated() {
			let key = "v\(index)"
			viewsDictionary[key] = view
			
		}
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
}
