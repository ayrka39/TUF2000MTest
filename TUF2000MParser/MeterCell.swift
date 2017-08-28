//
//  MeterCell.swift
//  TUF200MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

enum Unit: String {
	case flowRate = "㎥/h"
	case fluidSoundSpeed = "m/s"
	case temperature = "℃"
	case currentInputAI3 = "mA"

	var name: String {
		get { return String(describing: self) }
	}
}

enum Title: String {
	case flowRate = "Flow Rate"
	case fluidSoundSpeed = "Fluid Sound Speed"
	case inletTemperature = "Temperature Inlet"
	case outletTemperature = "Temperature Outlet"
	case analogInputAI3 = "Analog Input AI3"
	case currentInputAI3 = "Current Input AI3"
	case errorCode = "Error Code"
	case signalQuality = "Signal Quality"
	
	var name: String {
		get { return String(describing: self) }
	}
}

class MeterCell: BaseCell {

var register: Register? {
		didSet {
			guard let register = register else { return }
			registerNameLabel.text = register.title
			valueLabel.text = register.value
			valueUnit(.fluidSoundSpeed, unit: .fluidSoundSpeed)
			valueUnit(.flowRate, unit: .flowRate)
			valueUnit(.currentInputAI3, unit: .currentInputAI3)
			temperatureUnit()
		}
	}
	
	private func valueUnit(_ title: Title, unit: Unit) {
		if registerNameLabel.text == title.rawValue && title.name == unit.name {
			unitLabel.text = unit.rawValue
		}
	}
	
	private func temperatureUnit() {
		let inletTemp = Title.inletTemperature.rawValue
		let outletTemp = Title.outletTemperature.rawValue
		
		if registerNameLabel.text! == inletTemp || registerNameLabel.text! == outletTemp {
			unitLabel.text = Unit.temperature.rawValue
		}
	}
	
	
	
	let registerNameLabel: UILabel = {
		let label = UILabel()
		label.text = "+ Energy Accumulator"
		label.font = UIFont.systemFont(ofSize: 16)
		label.textAlignment = .center
		label.numberOfLines = 2
		return label
	}()
	
	let valueLabel: UILabel = {
		let label = UILabel()
		label.text = " -58"
		label.font = UIFont.systemFont(ofSize: 24)
		label.textAlignment = .center
		label.numberOfLines = 2
		label.layer.cornerRadius = 5
		label.layer.masksToBounds = true
		return label
	}()
	
	let unitLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 14)
		
		return label
	}()
	
	override func setupView() {
		super.setupView()
	
		setupCell()
		
		addSubViews(views: registerNameLabel, valueLabel, unitLabel)
		noAutoResizeMask(views: registerNameLabel, valueLabel, unitLabel)
		NSLayoutConstraint.activate([
			registerNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
			registerNameLabel.bottomAnchor.constraint(equalTo: valueLabel.topAnchor, constant: 8),
			registerNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			registerNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
			
			valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			valueLabel.rightAnchor.constraint(equalTo: unitLabel.leftAnchor, constant: 2),
			valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(self.frame.height / 12)),
			valueLabel.heightAnchor.constraint(equalToConstant: 32),
			
			unitLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
			unitLabel.bottomAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: -(self.frame.height / 10)),
			unitLabel.widthAnchor.constraint(equalToConstant: 30),
			unitLabel.heightAnchor.constraint(equalToConstant: 16)
			
		])
	}
	
	private func setupCell() {
	
		backgroundColor = .cellBackground(a: 0.8)
		layer.cornerRadius = 5
		layer.masksToBounds = true
	}
}
