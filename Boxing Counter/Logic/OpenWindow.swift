//
//  OpenWindow.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import AppKit
import ExtensionKit

enum OpenWindow: String, CaseIterable, Identifiable {
	
	// All views that can be opened
	case defaultView = "defaultView"
	case boxerManager = "boxerManager"
	case accountManager = "accountManager"
	case scoreboard = "scoreboard"
	
	var id: String { self.rawValue }
	
	func open() {
		Task {
			await MainActor.run { ()
				if !NSApplication.shared.windows.map({ $0.title.camelCased }).contains(self.rawValue.replacingOccurrences(of: "defaultView", with: "boxingCounter")) {
					if let url = URL(string: "boxingCounter://\(self.rawValue)") {
						NSWorkspace.shared.open(url)
					}
				}
			}
		}
	}
	
	func close() {
		// Close window
		for currWindow in NSApplication.shared.windows {
			if currWindow.title.camelCased == self.rawValue {
				currWindow.close()
			}
		}
	}
	
}

