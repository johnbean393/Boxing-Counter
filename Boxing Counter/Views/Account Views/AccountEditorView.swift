//
//  AccountEditorView.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import SwiftUI

struct AccountEditorView: View {
	
	@EnvironmentObject private var accountData: AccountData
	
	@StateObject private var accountEditorViewModel: AccountEditorViewModel = AccountEditorViewModel.shared
	
	@Binding var selectedAccount: Account?
	
    var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			Form {
				fields
				dangerZone
			}
			.formStyle(.grouped)
			.onChange(of: selectedAccount) {
				if selectedAccount != nil {
					accountEditorViewModel.account = selectedAccount!
				}
			}
		}
		.frame(minWidth: 450)
		.padding()
		.onAppear {
			accountEditorViewModel.account = selectedAccount!
		}
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
				TextField("", text: $accountEditorViewModel.account.username)
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
				TextField("", text: $accountEditorViewModel.account.password.password)
					.textFieldStyle(.plain)
			}
			// Only show if there are prior accounts
			if !accountData.values.isEmpty {
				Toggle(isOn: $accountEditorViewModel.account.isAdmin, label: {
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
			Text("Details")
		}
	}
	
	var dangerZone: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Delete")
						.font(.title3)
						.bold()
					Text("Deletes the account")
						.font(.caption)
				}
				Spacer()
				// Button to delete action
				Button {
					// Send alert
					let alert: NSAlert = NSAlert()
					alert.messageText = "Are you sure you want to delete this account?"
					alert.addButton(withTitle: "Cancel")
					alert.addButton(withTitle: "OK")
					if alert.runModal() == .alertSecondButtonReturn {
						accountData.delete(accountEditorViewModel.account)
						selectedAccount = nil
					}
				} label: {
					Label("Delete", systemImage: "trash")
				}
				.tint(Color.red)
			}
		} header: {
			Text("Danger Zone")
		}
	}
	
}

//#Preview {
//    AccountEditorView()
//}
