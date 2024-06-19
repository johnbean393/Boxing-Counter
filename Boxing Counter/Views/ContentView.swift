//
//  ContentView.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

struct ContentView: View {
	
	@EnvironmentObject private var sharedViewController: SharedViewController
	
    var body: some View {
		Group {
			switch sharedViewController.viewState {
				case .login:
					LoginView()
				case .matchManager:
					MatchManagerView()
						.frame(minWidth: 600, minHeight: 600)
			}
		}
    }
	
}

#Preview {
    ContentView()
}
