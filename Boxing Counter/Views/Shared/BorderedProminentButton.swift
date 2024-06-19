//
//  BorderedProminentButton.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct BorderedProminentButton: View {
	
	// Define params
	var text: String
	var icon: String?
	var fill: Color = Color.accentColor
	var borderFill: Color?
	var action: () -> Void
	
    var body: some View {
		Button {
			action()
		} label: {
			label
				.padding(6)
				.background {
					buttonBackground
				}
		}
		.buttonStyle(PlainButtonStyle())
    }
	
	var label: some View {
		Group {
			if icon == nil {
				Text(text)
			} else {
				Label(text, systemImage: icon!)
			}
		}
		.font(.title3)
		.foregroundStyle(fill.adaptedTextColor)
		.bold()
	}
	
	var buttonBackground: some View {
		RoundedRectangle(cornerRadius: 8)
			.fill(fill)
			.if(borderFill != nil) { view in
				view
					.stroke(borderFill!, lineWidth: 2)
			}
	}
	
}

#Preview {
	BorderedProminentButton(text: "Press Me") {
		print("Pressed")
	}
	.padding()
}
