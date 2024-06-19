//
//  ScoreboardView.swift
//  Boxing Counter
//
//  Created by Bean John on 19/6/2024.
//

import SwiftUI

struct ScoreboardView: View {
	
	@EnvironmentObject private var scoreboardViewController: ScoreboardViewController
	@EnvironmentObject private var accountData: AccountData
	
    var body: some View {
		LockView(
			isLocked: !accountData.isLoggedIn
		) {
			if scoreboardViewController.match != nil {
				VStack(spacing: 0) {
					ScoreboardTopBarView()
					ScoreboardBoxersView()
				}
			} else {
				Text("No match in progress.")
			}
		}
    }
}

#Preview {
    ScoreboardView()
}
