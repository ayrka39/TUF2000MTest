//
//  DataCalculation.swift
//  TUF200MParser
//
//  Created by David on 8/26/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension MasterDataSource {
	
	// MARK: Data Formular
	
	func total(_ lines: [String], _ firstIndex: Int, _ secondIndex: Int? = 0, title: RegisterTitle) {
		
		let firstValue = lines[firstIndex] 
		let secondValue = lines[secondIndex!] 
		
		var result = ""
		switch title {
		case .flowRate:
			result = real4ToFloat(firstValue, secondValue)
		case .analogInputAI3:
			result = real4ToFloat(firstValue, secondValue)
		case .fluidSoundSpeed:
			let rawResult = real4ToFloat(firstValue, secondValue)
			if rawResult.characters.contains(".") {
				let resultRange = String(rawResult.characters.prefix(5))
				result = resultRange
			} else {
				if rawResult.characters.count > 5 {
					result = "Extreme..."
				}
			}
		case .currentInputAI3:
			result = real4ToFloat(firstValue, secondValue)
		case .errorCode:
			result = getErrorCode(firstValue)
		case .signalQuality:
			result = getSignalQuality(firstValue)
		case .posAccumulator:
			result = accumulatedValue(firstValue, secondValue)
		case .negAccumulator:
			result = accumulatedValue(firstValue, secondValue)
		case .posEnergyAccumulator:
			result = accumulatedValue(firstValue, secondValue)
		case .negEnergyAccumulator:
			result = accumulatedValue(firstValue, secondValue)
		case .inletTemperature:
			result = real4ToFloat(firstValue, secondValue)
		case .outletTemperature:
			result = real4ToFloat(firstValue, secondValue)
		}
		
		let register = Register(title: title.rawValue, value: result)
		registers.append(register)
		
	}
	
}

