//
//  LoginView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct LoginView: View {
	
	@EnvironmentObject private var sharedViewController: SharedViewController
	@EnvironmentObject private var accountData: AccountData
	
	@State private var username: String = ""
	@State private var password: String = ""
	
    var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			fields
			buttons
		}
		.frame(minWidth: 400, maxWidth: 500)
		.padding()
    }
	
	var fields: some View {
		Group {
			Text("**Username:**")
				.font(.title2)
			TextField("Username", text: $username)
			Text("**Password:**")
				.font(.title2)
			SecureField("Password", text: $password)
		}
		.textFieldStyle(LoginFieldStyle())
	}
	
	var buttons: some View {
		HStack {
			Spacer()
			
			// New account button
			if accountData.values.isEmpty {
				BorderedProminentButton(text: "New Account", fill: Color.gray) {
					OpenWindow.accountManager.open()
					sharedViewController.isCreatingAccount = true
				}
			}
			
			// Cancel button, which quits the app
			BorderedProminentButton(text: "Cancel", fill: Color.gray) {
				NSApplication.shared.terminate(nil)
			}
			
			// Login button
			BorderedProminentButton(text: "Login") {
				// Try to login
				let loginResult: Bool = accountData.login(
					username: username,
					password: password
				)
				// If login failed
				if !loginResult {
					// Send alert
					let alert: NSAlert = NSAlert()
					alert.messageText = "Login failed. The username or password was incorrect."
					alert.addButton(withTitle: "OK")
					let _ = alert.runModal()
				} else {
					// If success, go to next view
					sharedViewController.nextViewState()
				}
			}
			.keyboardShortcut(.defaultAction)
		}
	}
	
}

#Preview {
    LoginView()
}
