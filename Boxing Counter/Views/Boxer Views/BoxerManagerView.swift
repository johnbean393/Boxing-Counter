//
//  BoxerManagerView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct BoxerManagerView: View {
	
	@EnvironmentObject private var boxerData: BoxerData
	@EnvironmentObject private var accountData: AccountData
	
	@State private var selectedBoxer: Boxer?
	
	@State private var isCreatingBoxer: Bool = false
	
	var body: some View {
		LockView(
			isLocked: !accountData.isLoggedIn
		) {
			NavigationSplitView {
				listView
			} detail: {
				detailView
			}
			.navigationTitle("Boxers")
			.sheet(isPresented: $isCreatingBoxer) {
				NewBoxerView(isCreatingBoxer: $isCreatingBoxer)
			}
		}
	}
	
	var listView: some View {
		VStack(spacing: 0) {
			List(boxerData.values, selection: $selectedBoxer) { boxer in
				NavigationLink(boxer.name.capitalized, value: boxer)
					.contextMenu {
						Button("Delete") {
							boxerData.delete(boxer)
						}
					}
			}
			VStack(spacing: 0) {
				Divider()
				HStack(spacing: 0) {
					Button("+") {
						isCreatingBoxer = true
					}
					.frame(width: 20, height: 20)
					Divider()
					Button("-") {
						boxerData.delete(selectedBoxer!)
						selectedBoxer = nil
					}
					.disabled(selectedBoxer == nil)
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
			if selectedBoxer != nil {
				BoxerEditorView(selectedBoxer: $selectedBoxer)
			} else {
				HStack {
					Text("Select an Boxer or")
					Button("Add an Boxer") {
						isCreatingBoxer = true
					}
				}
			}
		}
	}
}

#Preview {
	BoxerManagerView()
}
