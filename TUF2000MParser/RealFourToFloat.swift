//
//  DataConverisonFormula.swift
//  TUF200MParser
//
//  Created by David on 8/28/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension MasterDataSource {
	
	func real4ToFloat(_ high: String, _ low: String) -> String {
		
		// decimal value from the live feed to binary
		let highWord = high.decimalToBinary
		let lowWord = low.decimalToBinary
		
		// make binary complete 16 digits
		let highBinary = addZero(highWord)
		let lowBinnary = addZero(lowWord)
		
		// combine two values
		var combined = highBinary + lowBinnary
		
		// make 32 digits of binary
		if combined.characters.count != 32 {
			combined = addZero(combined)
		}
		
		// get sign from the first bit
		var sign = String(combined.characters.prefix(1))
		if sign == "0" {
			sign = "1"
		}
		
		// get exponent from the next 8 bits
		let start = combined.index(combined.startIndex, offsetBy: 1)
		let end = combined.index(combined.startIndex, offsetBy: 9)
		let range = start..<end
		let next8bits = combined.substring(with: range)
		let next8bitsDecimal = next8bits.binaryToDouble
		let exponent = next8bitsDecimal - Double(127)
		
		// get mantissa from the last 23 bits
		let final23bits = String(combined.characters.suffix(23))
		let final23ToDecimal = final23bits.binaryToDouble
		
		// divide previous result by given hexadecimal value
		var divisionDecimal = 0.0
		var mantissa = 0.0
		
		if exponent >= 1 {
			divisionDecimal = "800000".hexaToDouble
			mantissa = final23ToDecimal / divisionDecimal + 1
		} else {
			divisionDecimal = "400000".hexaToDouble
			mantissa = final23ToDecimal / divisionDecimal
		}
		
		let floatNumber = Double(sign)! * mantissa * pow(2, exponent)
		
		var result = 0.0
		if floatNumber < 1 &&  floatNumber > 0.0 {
			result = floatNumber.rounded(3)
		} else {
			result = floatNumber.rounded(1)
		}
		
		return String(result)
	}
	
	func addZero(_ string: String) -> String {
		var stringArr = Array(string.characters)
		if string == "0" {
			while stringArr.count < 16 {
				stringArr.append("0")
			}
			
		} else if string.characters.first != "0" {
			while stringArr.count <= 15 {
				stringArr.insert("0", at: 0)
			}
		}
		return String(stringArr)
	}
	
}
extension String {
	var hexaToInt: Int { return Int(strtoul(self, nil, 16)) }
	var hexaToDouble: Double { return Double(strtoul(self, nil, 16)) }
	var hexaToBinary: String { return String(hexaToInt, radix: 2) }
	var decimalToHexa: String { return String(Int(self) ?? 0, radix: 16)}
	var decimalToBinary: String { return String(Int(self) ?? 0, radix: 2) }
	var binaryToInt: Int { return Int(strtoul(self, nil, 2)) }
	var binaryToDouble: Double { return Double(strtoul(self, nil, 2)) }
	var binaryToHexa: String { return String(binaryToInt, radix: 16) }
}

extension Double {
	/// Rounds the double to decimal places value
	func rounded(_ places:Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}



