//
//  MatchEditorViewModel.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import Foundation
import SwiftUI

class MatchEditorViewModel: ObservableObject {
	
	static let shared: MatchEditorViewModel = MatchEditorViewModel()
	
	@Published var match: Match = Match(
		boxer1Id: BoxerData.shared.getFirstBoxer().id,
		boxer2Id: BoxerData.shared.getFirstBoxer().id,
		roundMins: 4,
		restMins: 1,
		rounds: 1
	) {
		didSet {
			MatchData.shared.update(match)
		}
	}
	
}
