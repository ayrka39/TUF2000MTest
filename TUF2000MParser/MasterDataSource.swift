//
//  MasterDataSource.swift
//  TUF2000MParser
//
//  Created by David on 8/24/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit
import CoreData

enum RegisterTitle: String {
	case flowRate = "Flow Rate"
	case fluidSoundSpeed = "Fluid Sound Speed"
	case posAccumulator = "Positive Accumulator"
	case negAccumulator = "Negative Accumulator"
	case posEnergyAccumulator = "+ Energy Accumulator"
	case negEnergyAccumulator = "- Energy Accumulator"
	case inletTemperature = "Temperature Inlet"
	case outletTemperature = "Temperature Outlet"
	case analogInputAI3 = "Analog Input AI3"
	case currentInputAI3 = "Current Input AI3"
	case errorCode = "Error Code"
	case signalQuality = "Signal Quality"
}

class MasterDataSource: NSObject {

	var calendars: [Calendar] = []
	var registers: [Register] = []
	
	let urlString = "http://tuftuf.gambitlabs.fi/feed.txt"
	
	func getValues() {
		
		guard let url = URL(string: urlString) else { return }
		
		// text manipulation
		
			do {
				let contents = try String(contentsOf: url)
				var lines = contents.components(separatedBy: "\n")
				
				for (index, line) in lines.enumerated() {
					
					guard let character = line.characters.index(of: ":") else { return }
					let separator = line.characters.index(after: character)
					guard let rawValue = Int(line.substring(from: separator)) else { return }
					lines[index] = String(rawValue)
					
					// get reading date and time
					
					if index == 0 {
						getCalendarData(line)
						
					// get reading values
						
					} else if index > 0 {
						getReadingValues(index, lines)
						
					}
				}

			} catch let loadError {
				print(loadError)
			}
	}
	
	func getCalendarData(_ line: String) {
		let readingTime = Calendar(time: line)
		calendars.append(readingTime)
	}
	
	
	func getReadingValues(_ index: Int, _ lines: [String]) {
		
		switch index {
		case 2:
			total(lines, 1, 2, title: .flowRate)
			break
		case 38:
			total(lines, 37, 38, title: .analogInputAI3)
			break
		case 8:
			total(lines, 7, 8, title: .fluidSoundSpeed)
			break
		case 44:
			total(lines, 43, 44, title: .currentInputAI3)
			break
		case 72:
			total(lines, 72, 0, title: .errorCode)
		case 92 :
			total(lines, 92, 0, title: .signalQuality)
			
		case 10:
			total(lines, 9, 10, title: .posAccumulator)
			break
		case 14:
			total(lines, 13, 14, title: .negAccumulator)
			break
		case 18:
			total(lines, 17, 18, title: .posEnergyAccumulator)
			break
		case 22:
			total(lines, 21, 22, title: .negEnergyAccumulator)
			break
		case 34:
			total(lines, 33, 34, title: .inletTemperature)
			break
		case 36:
			total(lines, 35, 36, title: .outletTemperature)
			
		default:
			break
		}

	}
}

