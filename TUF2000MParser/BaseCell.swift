//
//  BaseCell.swift
//  TUF2000MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

open class BaseCell: UICollectionViewCell {

	public override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	let separatorLineView: UIView = {
		let lineView = UIView()
		lineView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
		lineView.isHidden = true
		
		return lineView
	}()
	
	open func setupView() {
		
		clipsToBounds = true
		addSubview(separatorLineView)
		noAutoResizeMask(views: separatorLineView)
		addConstraintsWithFormat("V:[v0(0.5)]-12-|", views: separatorLineView)
		addConstraintsWithFormat("H:|[v0]|", views: separatorLineView)
		
	}
}
