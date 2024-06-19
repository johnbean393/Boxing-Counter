//
//  MatchData.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import ExtensionKit

class MatchData: ValueDataModel<Match> {
	
	static let shared: MatchData = MatchData()
	
	required init(appDirName: String = Bundle.main.applicationName ?? Bundle.main.description, datastoreName: String = "matchData") {
		super.init(appDirName: appDirName, datastoreName: datastoreName)
	}
	
}
