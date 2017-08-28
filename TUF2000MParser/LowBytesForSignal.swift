//
//  LowBytesForSignal.swift
//  TUF200MParser
//
//  Created by David on 8/28/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

extension MasterDataSource {
	
	// get low bytes from the value received
	
	func getSignalQuality(_ value: String) -> String {
		let binary = value.decimalToBinary
		let lowBytes = String(binary.characters.suffix(8))
		let sigQuality = lowBytes.binaryToInt
		
		return String(sigQuality)
	}
	
}
