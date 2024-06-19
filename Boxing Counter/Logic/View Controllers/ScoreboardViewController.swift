//
//  ScoreboardViewController.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import Foundation
import SwiftUI

class ScoreboardViewController: ObservableObject {
	
	static let shared: ScoreboardViewController = ScoreboardViewController()
	
	@Published var match: Match? = nil
	
	public func setMatch(match: Match?) {
		// Confirm with user
		if self.match != nil {
			let alert: NSAlert = NSAlert()
			alert.messageText = "Are you sure you want to end the current match?"
			alert.addButton(withTitle: "Cancel")
			alert.addButton(withTitle: "OK")
			if alert.runModal() == .alertSecondButtonReturn {
				self.match = match
			}
		} else {
			self.match = match
		}
	}
	
	public func endMatch(match: Match) {
		// Set match to blank
		self.setMatch(match: nil)
	}
	
}
