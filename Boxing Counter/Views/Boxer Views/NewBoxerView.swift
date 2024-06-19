//
//  NewBoxerView.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import SwiftUI
import ExtensionKit

struct NewBoxerView: View {
	
	@EnvironmentObject private var boxerData: BoxerData
	
	@Binding var isCreatingBoxer: Bool
	
	@State private var boxer: Boxer = Boxer(
		name: "",
		nickname: "",
		height: 190,
		weight: 157,
		emblemColor: .red
	)
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			HStack {
				Form {
					fields
					attributes
				}
				.formStyle(.grouped)
				.scrollIndicators(.never)
				.frame(minWidth: 450, minHeight: 400)
				boxer.visualization
			}
			Divider()
			buttons
		}
		.padding()
	}
	
	var fields: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Name")
						.font(.title3)
						.bold()
					Text("The boxer's name")
						.font(.caption)
				}
				Spacer()
				TextField("", text: $boxer.name)
					.textFieldStyle(.plain)
			}
			HStack {
				VStack(alignment: .leading) {
					Text("Nickname")
						.font(.title3)
						.bold()
					Text("The boxer's nickname")
						.font(.caption)
				}
				Spacer()
				TextField("", text: $boxer.nickname)
					.textFieldStyle(.plain)
			}
		} header: {
			Text("**Name**")
				.font(.title2)
		}
	}
	
	var attributes: some View {
		Section {
			HStack {
				VStack(alignment: .leading) {
					Text("Height: \(boxer.heightDescription)")
						.font(.title3)
						.bold()
					Text("The boxer's height")
						.font(.caption)
				}
				Spacer()
				Slider(value: $boxer.height, in: 0...300)
					.frame(width: 250)
			}
			HStack {
				VStack(alignment: .leading) {
					Text("Weight: \(boxer.weightDescription)")
						.font(.title3)
						.bold()
					Text("The boxer's weight")
						.font(.caption)
				}
				Spacer()
				Slider(value: $boxer.weight, in: 0...300)
					.frame(width: 250)
			}
			colorSelector
		} header: {
			Text("**Attributes**")
				.font(.title2)
		}
	}
	
	var colorSelector: some View {
		HStack {
			Text("Color")
				.font(.title3)
				.bold()
			Spacer()
			ForEach(Boxer.EmblemColor.allCases, id: \.self) { color in
				Circle()
					.fill(color.color)
					.frame(width: 15)
					.padding(3)
					.background {
						Circle()
							.fill(
								color == boxer.emblemColor ? Color.accentColor : Color.primary
							)
					}
					.onTapGesture {
						boxer.emblemColor = color
					}
			}
		}
	}
	
	var buttons: some View {
		HStack {
			Spacer()
			Group {
				BorderedProminentButton(text: "Cancel", fill: Color.gray) {
					isCreatingBoxer = false
				}
				BorderedProminentButton(text: "Confirm") {
					addBoxer()
				}
				.keyboardShortcut(.defaultAction)
			}
			.scaleEffect(0.9)
		}
		.padding(.vertical, 5)
	}
	
	func addBoxer() {
		// Conduct checks
		if boxer.name.isEmpty || boxer.nickname.isEmpty {
			// If any are blank, send alert
			let alert: NSAlert = NSAlert()
			alert.messageText = "Boxer creation failed. A field is blank."
			alert.addButton(withTitle: "OK")
			let _ = alert.runModal()
			return
		}
		// Add boxer to list
		boxerData.add(boxer)
		// Close sheet
		isCreatingBoxer = false
	}
	
}

#Preview {
	NewBoxerView(isCreatingBoxer: .constant(true))
}
