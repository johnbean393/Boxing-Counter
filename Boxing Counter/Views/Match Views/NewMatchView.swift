//
//  NewMatchView.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import SwiftUI

struct NewMatchView: View {
	
	@EnvironmentObject private var boxerData: BoxerData
	@EnvironmentObject private var matchData: MatchData
	
	@Binding var isCreatingMatch: Bool
	
	@State private var match: Match = Match(
		boxer1Id: BoxerData.shared.getFirstBoxer().id,
		boxer2Id: BoxerData.shared.getFirstBoxer().id,
		roundMins: 4,
		restMins: 1,
		rounds: 1
	)
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			Form {
				boxers
				properties
			}
			.formStyle(.grouped)
			buttons
		}
		.frame(width: 450)
		.padding()
	}
	
	var boxers: some View {
		Section {
			HStack {
				Text("Boxer 1")
					.font(.title3)
					.bold()
				Spacer()
				Picker("", selection: $match.boxer1) {
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
				Picker("", selection: $match.boxer2) {
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
						Text("Round Duration: \(match.roundMins) mins")
							.font(.title3)
							.bold()
						Text("The duration of a round")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $match.roundMins, in: 1...10)
				}
				HStack {
					VStack(alignment: .leading) {
						Text("Rest Duration: \(match.restMins) mins")
							.font(.title3)
							.bold()
						Text("The duration of a rest")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $match.restMins, in: 0...5)
				}
				HStack {
					VStack(alignment: .leading) {
						Text("Rounds: \(match.rounds)")
							.font(.title3)
							.bold()
						Text("The number of rounds")
							.font(.caption)
					}
					Spacer()
					Stepper("", value: $match.rounds, in: 1...15)
				}
				Text("Total Duration: \(round((Float(match.totalTimeSecs) / Float(60)) * 10) / 10) mins")
					.font(.title3)
					.bold()
			}
		} header: {
			Text("**Attributes**")
				.font(.title2)
		}
	}
	
	var buttons: some View {
		HStack {
			Spacer()
			BorderedProminentButton(text: "Cancel", fill: Color.gray) {
				isCreatingMatch = false
			}
			BorderedProminentButton(text: "Confirm") {
				addMatch()
			}
			.keyboardShortcut(.defaultAction)
		}
	}
	
	func addMatch() {
		// Conduct checks
		if match.boxer1.name.isEmpty || match.boxer2.name.isEmpty {
			// If any are blank, send alert
			let alert: NSAlert = NSAlert()
			alert.messageText = "Match creation failed. A field is blank."
			alert.addButton(withTitle: "OK")
			let _ = alert.runModal()
			return
		}
		// Add the match
		matchData.add(match)
		// Close the sheet
		isCreatingMatch = false
	}
	
}

#Preview {
	NewMatchView(isCreatingMatch: .constant(true))
}
