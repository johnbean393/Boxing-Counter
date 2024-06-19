//
//  BoxerEditorView.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import SwiftUI

struct BoxerEditorView: View {
	
	@Binding var selectedBoxer: Boxer?
	
	@StateObject private var boxerEditorViewModel: BoxerEditorViewModel = BoxerEditorViewModel.shared
	
	var body: some View {
		HStack {
			Form {
				fields
				attributes
			}
			.formStyle(.grouped)
			.scrollIndicators(.never)
			.frame(minWidth: 450, minHeight: 400)
			.onChange(of: selectedBoxer) {
				if selectedBoxer != nil {
					boxerEditorViewModel.boxer = selectedBoxer!
				}
			}
			boxerEditorViewModel.boxer.visualization
		}
		.padding(.horizontal)
		.onAppear {
			boxerEditorViewModel.boxer = selectedBoxer!
		}
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
				TextField("", text: $boxerEditorViewModel.boxer.name)
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
				TextField("", text: $boxerEditorViewModel.boxer.nickname)
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
					Text("Height: \(boxerEditorViewModel.boxer.heightDescription)")
						.font(.title3)
						.bold()
					Text("The boxer's height")
						.font(.caption)
				}
				Spacer()
				Slider(value: $boxerEditorViewModel.boxer.height, in: 0...300)
					.frame(width: 250)
			}
			HStack {
				VStack(alignment: .leading) {
					Text("Weight: \(boxerEditorViewModel.boxer.weightDescription)")
						.font(.title3)
						.bold()
					Text("The boxer's weight")
						.font(.caption)
				}
				Spacer()
				Slider(value: $boxerEditorViewModel.boxer.weight, in: 0...300)
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
								color == boxerEditorViewModel.boxer.emblemColor ? Color.accentColor : Color.primary
							)
					}
					.onTapGesture {
						boxerEditorViewModel.boxer.emblemColor = color
					}
			}
		}
	}
	
}

//#Preview {
//    BoxerEditorView()
//}
