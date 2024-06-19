//
//  Boxing_CounterApp.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI
import ExtensionKit

@main
struct Boxing_CounterApp: App {
	
	@StateObject private var sharedViewController: SharedViewController = .shared
	@StateObject private var scoreboardViewController: ScoreboardViewController = .shared
	@StateObject private var accountData: AccountData = .shared
	@StateObject private var matchData: MatchData = .shared
	@StateObject private var boxerData: BoxerData = .shared
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(sharedViewController)
				.environmentObject(accountData)
				.environmentObject(boxerData)
				.environmentObject(matchData)
        }
		.defaultPositionCenter()
		.windowResizabilityContentSize()
		.handlesExternalEvents(matching: Set(arrayLiteral: "defaultView"))
		
		WindowGroup("Boxer Manager") {
			BoxerManagerView()
				.environmentObject(sharedViewController)
				.environmentObject(accountData)
				.environmentObject(boxerData)
				.frame(minWidth: 600, minHeight: 600)
		}
		.defaultPositionCenter()
		.handlesExternalEvents(matching: Set(arrayLiteral: "boxerManager"))
		
		WindowGroup("Account Manager") {
			AccountManagerView()
				.environmentObject(sharedViewController)
				.environmentObject(accountData)
				.frame(minWidth: 600, minHeight: 600)
		}
		.defaultPositionCenter()
		.handlesExternalEvents(matching: Set(arrayLiteral: "accountManager"))
	
		WindowGroup("Scoreboard") {
			ScoreboardView()
				.environmentObject(scoreboardViewController)
				.environmentObject(sharedViewController)
				.environmentObject(accountData)
				.environmentObject(boxerData)
				.environmentObject(matchData)
		}
    }
	
}
