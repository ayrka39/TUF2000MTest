//
//  SixteenBits.swift
//  TUF200MParser
//
//  Created by David on 8/28/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit


enum ErrorCode: Int {
  case noSignalReceived = 0
  case lowSignalReceived = 1
  case poorSignalReceived = 2
  case pipeEmpty = 3
  case hardwareFailure = 4
  case circuitsGaininAdjusting = 5
  case frequencyOutputOverflow = 6
  case currentOverflow = 7
  case RAMchecksumError = 8
  case mainClockTimerclockError = 9
  case parametersChecksumError = 10
  case ROMchecksumError = 11
  case temperatureCircuitsError = 12
  case reserved = 13
  case internalIimerOverflow = 14
  case analogInputOverrange = 15
	
}

extension MasterDataSource {
	
	func getErrorCode(_ value: String) -> String {
		
		// get number of bits from the value received
		
		let binary = value.decimalToBinary
		let numberOfBinary = binary.lengthOfBytes(using: .utf8)
		return String(numberOfBinary)

	}

}
