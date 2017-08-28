//
//  Header.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class Header: BaseCell {
	
	var calendar: Calendar? {
		didSet {
			guard let calendar = calendar else { return }
			timeLabel.text = calendar.time
		}
	}

	let readingLabel: UILabel = {
		let label = UILabel()
		label.text = "Current Reading:"
		label.font = UIFont.systemFont(ofSize: 16)
		
		return label
	}()
	
	var timeLabel: UILabel = {
		let label = UILabel()
		label.text = "2017-08-23 17:14"
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .right
		label.textColor = .darkGray
		
		return label
	}()
	
	override func setupView() {
		super.setupView()
		
		separatorLineView.isHidden = false
	
		addSubViews(views: readingLabel, timeLabel)
		noAutoResizeMask(views: readingLabel, timeLabel)
		
		
		NSLayoutConstraint.activate([
			readingLabel.topAnchor.constraint(equalTo: self.topAnchor),
			readingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
			readingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
			readingLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor),
			
			timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
			timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
			timeLabel.widthAnchor.constraint(equalToConstant: 160),
			timeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -4)
		])
	}
}
