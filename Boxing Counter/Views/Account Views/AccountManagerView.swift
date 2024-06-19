//
//  AccountManagerView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct AccountManagerView: View {
	
	@EnvironmentObject private var accountData: AccountData
	@EnvironmentObject private var sharedViewController: SharedViewController
	
	@State private var selectedAccount: Account?
	
    var body: some View {
		LockView(
			isLocked: !(accountData.isLoggedIn && accountData.isAdmin)
		) {
			NavigationSplitView {
				listView
			} detail: {
				detailView
			}
			.navigationTitle("Accounts")
		}
		.sheet(isPresented: $sharedViewController.isCreatingAccount) {
			NewAccountView(isCreatingAccount: $sharedViewController.isCreatingAccount)
		}
    }
	
	var listView: some View {
		VStack(spacing: 0) {
			List(accountData.values, selection: $selectedAccount) { account in
				NavigationLink(account.username.capitalized, value: account)
					.contextMenu {
						Button("Delete") {
							accountData.delete(account)
						}
					}
			}
			VStack(spacing: 0) {
				Divider()
				HStack(spacing: 0) {
					Button("+") {
						sharedViewController.isCreatingAccount = true
					}
					.frame(width: 20, height: 20)
					Divider()
					Button("-") {
						accountData.delete(selectedAccount!)
						selectedAccount = nil
					}
					.disabled(selectedAccount == nil)
					.frame(width: 20, height: 20)
					Divider()
					Spacer()
				}
				.buttonStyle(BorderlessButtonStyle())
				.padding([.leading, .bottom], 3)
			}
			.frame(height: 21)
		}
		.navigationSplitViewColumnWidth(125)
	}
	
	var detailView: some View {
		Group {
			if selectedAccount != nil {
				AccountEditorView(selectedAccount: $selectedAccount)
			} else {
				HStack {
					Text("Select an Account or")
					Button("Add an Account") {
						sharedViewController.isCreatingAccount = true
					}
				}
			}
		}
	}
	
}

#Preview {
    AccountManagerView()
}
