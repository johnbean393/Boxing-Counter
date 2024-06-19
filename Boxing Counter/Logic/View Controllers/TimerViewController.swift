//
//  TimerViewController.swift
//  Boxing Counter
//
//  Created by Bean John on 19/6/2024.
//

import Foundation
import SwiftUI
import ExtensionKit

class TimerViewController: ObservableObject {
	
	@Published var timeRemaining: Int = 0
	var timeRemainingDescription: String {
		let minutes: Int = Int(Float(timeRemaining)/60.0)
		let seconds: Int = timeRemaining - (minutes * 60)
		return "\(minutes.addLeadingZeros()):\(seconds.addLeadingZeros())"
	}
	
	var timer: Timer?
	
	func resetTimer() {
		if timer != nil {
			self.timer!.invalidate()
			self.timer = nil
		}
	}
	
	func setTimer(duration: Int) {
		timeRemaining = duration
		timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
			withAnimation(.spring) {
				if self.timeRemaining > 0 {
					self.timeRemaining -= 1
				} else {
					self.timer!.invalidate()
					self.timer = nil
				}
			}
		})
	}
	
	enum RoundState: String {
		case rest, round
		
	}
	
}
