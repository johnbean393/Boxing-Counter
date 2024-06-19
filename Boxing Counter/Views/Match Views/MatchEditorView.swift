//
//  MatchEditorView.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import SwiftUI

struct MatchEditorView: View {
	
	@Binding var selectedMatch: Match?
	
	@StateObject private var matchEditorViewModel: MatchEditorViewModel = MatchEditorViewModel.shared
	@EnvironmentObject private var boxerData: BoxerData
	@EnvironmentObject private var matchData: MatchData
	
	var body: some View {
		HStack {
			Form {
				boxers
				properties
				actions
				dangerZone
			}
			.formStyle(.grouped)
			.scrollIndicators(.never)
			.frame(minWidth: 450, minHeight: 400)
			.onChange(of: selectedMatch) {
				if selectedMatch != nil {
					matchEditorViewModel.match = selectedMatch!
				}
			}
		}
		.padding(.horizontal)
		.onAppear {
			matchEditorViewModel.match = selectedMatch!
		}
	}
	
	var boxers: some View {
		Section {
			HStack {
				Text("Boxer 1")
					.font(.title3)
					.bold()
				Spacer()
				Picker("", selection: $matchEditorViewModel.match.boxer1) {
					ForEach(boxerData.values) { boxer in
						Text(boxer.name)
							.tag(boxer)
					}
				}
			}
			HStack {
				Text("Boxer 2")
					.font(.title3)
					.bold()
				Spacer()
				Picker("", selection: $matchEditorViewModel.match.boxer2) {
					ForEach(boxerData.values) { boxer in
						Text(boxer.name)
							.tag(boxer)
					}
				}
			}
		} header: {
			Text("**Boxers**")
				.font(.title2)
		}
	}
	
	var properties: some View {
		Section {
			Group {
				HStack {
					VStack(alignment: .leading) {
						Text("Round Duration: \(matchEditorViewModel.match.roundMins) mins")
							.font(.title3)
							.bold()
						Text("The duration of a round")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $matchEditorViewModel.match.roundMins, in: 1...10)
				}
				HStack {
					VStack(alignment: .leading) {
						Text("Rest Duration: \(matchEditorViewModel.match.restMins) mins")
							.font(.title3)
							.bold()
						Text("The duration of a rest")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $matchEditorViewModel.match.restMins, in: 0...5)
				}
				HStack {
					VStack(alignment: .leading) {
						Text("Rounds: \(matchEditorViewModel.match.rounds)")
							.font(.title3)
							.bold()
						Text("The number of rounds")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $matchEditorViewModel.match.rounds, in: 1...15)
				}
				Text("Total Duration: \(round((Float(matchEditorViewModel.match.totalTimeSecs) / Float(60)) * 10) / 10) mins")
					.font(.title3)
					.bold()
			}
		} header: {
			Text("**Attributes**")
				.font(.title2)
		}
	}
	
	var actions: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Start")
						.font(.title3)
						.bold()
					Text("Starts the match")
						.font(.caption)
				}
				Spacer()
				// Button to start match
				Button {
					OpenWindow.scoreboard.close()
					OpenWindow.scoreboard.open()
					ScoreboardViewController.shared.match = selectedMatch!
				} label: {
					Label("Start", systemImage: "play.fill")
				}
			}
		} header: {
			Text("**Actions**")
				.font(.title2)
		}
	}
	
	var dangerZone: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Delete")
						.font(.title3)
						.bold()
					Text("Deletes the match")
						.font(.caption)
				}
				Spacer()
				// Button to delete action
				Button {
					// Send alert
					let alert: NSAlert = NSAlert()
					alert.messageText = "Are you sure you want to delete this match?"
					alert.addButton(withTitle: "Cancel")
					alert.addButton(withTitle: "OK")
					if alert.runModal() == .alertSecondButtonReturn {
						matchData.delete(matchEditorViewModel.match)
						selectedMatch = nil
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
//    MatchEditorView()
//}
