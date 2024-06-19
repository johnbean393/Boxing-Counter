//
//  BoxerData.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import ExtensionKit

class BoxerData: ValueDataModel<Boxer> {
	
	static let shared: BoxerData = BoxerData()
	
	required init(appDirName: String = Bundle.main.applicationName ?? Bundle.main.description, datastoreName: String = "boxerData") {
		super.init(appDirName: appDirName, datastoreName: datastoreName)
	}
	
	public func getFirstBoxer() -> Boxer {
		// Get first boxer
		if let firstBoxer: Boxer = self.values.first {
			return firstBoxer
		} else {
			return Boxer(name: "", nickname: "", height: 0, weight: 0, emblemColor: .red)
		}
	}
	
}
