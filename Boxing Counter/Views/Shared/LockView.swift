//
//  LockView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct LockView<Content: View>: View {
	
	init(isLocked: Bool, @ViewBuilder content: @escaping () -> Content) {
		self.isLocked = isLocked
		self.content = content
	}
	
	var isLocked: Bool
	var content: () -> Content
	
	var body: some View {
		Group {
			if !isLocked {
				content()
			} else {
				VStack {
					Image(systemName: "lock.circle.fill")
						.resizable()
						.frame(maxWidth: 200, maxHeight: 200)
						.padding(.bottom)
					Text("Please log in with the correct credentials.")
						.bold()
						.font(.title2)
				}
			}
		}
	}
	
}

#Preview {
	VStack {
		LockView(isLocked: true) {
			Text("Test")
		}
	}
}
