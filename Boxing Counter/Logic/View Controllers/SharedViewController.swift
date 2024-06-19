//
//  SharedViewController.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import SwiftUI

class SharedViewController: ObservableObject {
	
	static let shared: SharedViewController = SharedViewController()
	
	/// Controls whether the account creation view is shown
	@Published var isCreatingAccount: Bool = false
	
	/// Controls the current view state
	@Published var viewState: ViewState = .login
	
	/// Define all possible view states
	enum ViewState: CaseIterable {
		case login, matchManager
	}
	
	/// Switch to next view
	public func nextViewState() {
		let stateSequence: [ViewState] = (ViewState.allCases + ViewState.allCases)
		let currIndex: Int = stateSequence.firstIndex(of: self.viewState)!
		self.viewState = stateSequence[currIndex + 1]
	}
	
	/// Switch to previous view
	public func lastViewState() {
		let stateSequence: [ViewState] = (ViewState.allCases + ViewState.allCases)
		let currIndex: Int = stateSequence.firstIndex(of: self.viewState)!
		self.viewState = stateSequence[currIndex - 1]
	}
	
}
