//
//  NewAccountView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct NewAccountView: View {
	
	@EnvironmentObject private var accountData: AccountData
	
	@Binding var isCreatingAccount: Bool
	
	@State private var username: String = ""
	@State private var password: String = ""
	@State private var confirmPassword: String = ""
	@State private var isAdmin: Bool = true
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			Form {
				fields
			}
			.formStyle(.grouped)
			buttons
		}
		.frame(width: 450)
		.padding()
	}
	
	var fields: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Username")
						.font(.title3)
						.bold()
					Text("The user's name")
						.font(.caption)
				}
				Spacer()
				TextField("", text: $username)
					.textFieldStyle(.plain)
			}
			HStack {
				VStack(alignment: .leading) {
					Text("Password")
						.font(.title3)
						.bold()
					Text("The user's password")
						.font(.caption)
				}
				Spacer()
				SecureField("", text: $password)
					.textFieldStyle(.plain)
			}
			HStack {
				VStack(alignment: .leading) {
					Text("Confirm Password")
						.font(.title3)
						.bold()
					Text("The user's password")
						.font(.caption)
				}
				Spacer()
				SecureField("", text: $confirmPassword)
					.textFieldStyle(.plain)
			}
			// Only show if there are prior accounts
			if !accountData.values.isEmpty {
				Toggle(isOn: $isAdmin, label: {
					VStack(alignment: .leading) {
						Text("Admin Permissions")
							.font(.title3)
							.bold()
						Text("Controls whether the user has admin permissions")
							.font(.caption)
					}
				})
				.toggleStyle(.switch)
			}
		} header: {
			Text("**New Account**")
				.font(.title2)
		}
		.textFieldStyle(LoginFieldStyle())
	}
	
	var buttons: some View {
		HStack {
			Spacer()
			BorderedProminentButton(text: "Cancel", fill: Color.gray) {
				isCreatingAccount = false
			}
			BorderedProminentButton(text: "Confirm") {
				addAccount()
			}
			.keyboardShortcut(.defaultAction)
		}
	}
	
	func addAccount() {
		// Check if fields are blank
		if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
			// If any are blank, send alert
			let alert: NSAlert = NSAlert()
			alert.messageText = "Account creation failed. A field is blank."
			alert.addButton(withTitle: "OK")
			let _ = alert.runModal()
			return
		}
		// Check if passwords match
		if password != confirmPassword {
			// If not, send alert
			let alert: NSAlert = NSAlert()
			alert.messageText = "Account creation failed. The passwords don't match."
			alert.addButton(withTitle: "OK")
			let _ = alert.runModal()
			return
		}
		// Check if username exists
		if !accountData.values.filter({ $0.username == username }).isEmpty {
			// If yes, send alert
			let alert: NSAlert = NSAlert()
			alert.messageText = "Account creation failed. The username \"\(username)\" has been taken."
			alert.addButton(withTitle: "OK")
			let _ = alert.runModal()
			return
		}
		// Else, add a new account
		accountData.add(
			Account(
				username: username,
				password: Password(password: password),
				isAdmin: isAdmin
			)
		)
		// Send alert
		let alert: NSAlert = NSAlert()
		alert.messageText = "Successfully created account."
		alert.addButton(withTitle: "OK")
		let _ = alert.runModal()
		// Close sheet
		isCreatingAccount = false
	}
	
}

#Preview {
	NewAccountView(isCreatingAccount: .constant(true))
}
