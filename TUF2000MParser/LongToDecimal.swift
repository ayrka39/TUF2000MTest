//
//  LongToDecimal.swift
//  TUF200MParser
//
//  Created by David on 8/28/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension MasterDataSource {
	
	func accumulatedValue(_ high: String, _ low: String) -> String {
		
		// get lower byte first and then substract second value plus one from the first value
		
		let highBinary = high.decimalToBinary
		let lowBinary = low.decimalToBinary
		let highLowBytes = String(highBinary.characters.suffix(8))
		let lowLowBytes = String(lowBinary.characters.suffix(8))
		let highInt = highLowBytes.binaryToInt
		let lowInt = lowLowBytes.binaryToInt
		
		let value = highInt - (lowInt + 1)
		return String(value)
	}
	
}
