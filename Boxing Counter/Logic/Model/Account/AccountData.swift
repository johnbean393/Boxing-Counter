//
//  AccountData.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import ExtensionKit
import AppKit
import SwiftUI

class AccountData: ValueDataModel<Account> {
	
	static let shared: AccountData = AccountData()
	
	/// Initializer
	required init(appDirName: String = Bundle.main.applicationName ?? Bundle.main.description, datastoreName: String = "accountData") {
		super.init(appDirName: appDirName, datastoreName: datastoreName)
	}
	
	/// Function containing current user id
	@Published var currentUserId: UUID? = nil {
		didSet {
			if currentUserId == nil {
				SharedViewController.shared.viewState = .login
			}
		}
	}
	
	var currentUser: Account? {
		return self.values.filter({ $0.id == currentUserId }).first ?? nil
	}
	
	var isLoggedIn: Bool {
		return currentUserId != nil
	}
	
	var isAdmin: Bool {
		return currentUser?.isAdmin ?? false
	}
	
	/// Function for user to login
	public func login(username: String, password: String) -> Bool {
		// Check against records
		for value in self.values {
			// On match
			if value.username == username && value.password.password == password {
				// Log current user id
				currentUserId = value.id
				// Return success
				return true
			}
		}
		// If no match made, return login fail
		return false
	}
	
	/// Function for user to logout
	public func logout() {
		// Send alert
		let alert: NSAlert = NSAlert()
		alert.messageText = "Are you sure you want to log out?"
		alert.addButton(withTitle: "No")
		alert.addButton(withTitle: "Yes")
		// If confirmed, log out
		if alert.runModal() == .alertSecondButtonReturn {
			SharedViewController.shared.viewState = .login
			currentUserId = nil
		}
	}
	
	public func updateAccount(_ value: Account) {
		withAnimation(.spring()) {
			for valueIndex in self.values.indices {
				if value.id == self.values[valueIndex].id {
					self.values[valueIndex] = value
					break
				}
			}
		}
	}
	
}
