//
//  MatchManagerView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct MatchManagerView: View {
	
	@EnvironmentObject private var matchData: MatchData
	@EnvironmentObject private var accountData: AccountData
	
	@State private var selectedMatch: Match?
	@State private var isCreatingMatch: Bool = false
	
    var body: some View {
		NavigationSplitView {
			listView
		} detail: {
			detailView
		}
		.navigationTitle("Matches")
		.sheet(isPresented: $isCreatingMatch) {
			NewMatchView(isCreatingMatch: $isCreatingMatch)
		}
		.toolbar {
			ToolbarItemGroup {
				Button {
					OpenWindow.accountManager.open()
				} label: {
					Label("Manage Accounts", systemImage: "person.fill")
						.labelStyle(.iconOnly)
				}
				Button {
					OpenWindow.boxerManager.open()
				} label: {
					Label("Manage Boxers", systemImage: "figure.boxing")
						.labelStyle(.iconOnly)
				}
				Button {
					accountData.logout()
				} label: {
					Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
						.labelStyle(.iconOnly)
				}
			}
		}
    }
	
	var listView: some View {
		VStack(spacing: 0) {
			List(matchData.values, selection: $selectedMatch) { match in
				NavigationLink(match.name, value: match)
					.contextMenu {
						Button("Delete") {
							matchData.delete(match)
						}
					}
			}
			VStack(spacing: 0) {
				Divider()
				HStack(spacing: 0) {
					Button("+") {
						isCreatingMatch = true
					}
					.frame(width: 20, height: 20)
					Divider()
					Button("-") {
						matchData.delete(selectedMatch!)
						selectedMatch = nil
					}
					.disabled(selectedMatch == nil)
					.frame(width: 20, height: 20)
					Divider()
					Spacer()
				}
				.buttonStyle(BorderlessButtonStyle())
				.padding([.leading, .bottom], 3)
			}
			.frame(height: 21)
		}
		.navigationSplitViewColumnWidth(150)
	}
	
	var detailView: some View {
		Group {
			if selectedMatch != nil {
				MatchEditorView(selectedMatch: $selectedMatch)
			} else {
				HStack {
					Text("Select a Match or")
					Button("Add a Match") {
						isCreatingMatch = true
					}
				}
			}
		}
	}
	
}

#Preview {
    MatchManagerView()
}
