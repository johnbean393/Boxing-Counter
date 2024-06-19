//
//  BoxerEditorViewModel.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import Foundation
import SwiftUI

class BoxerEditorViewModel: ObservableObject {
	
	static let shared: BoxerEditorViewModel = BoxerEditorViewModel()
	
	@Published var boxer: Boxer = Boxer(
		name: "", 
		nickname: "",
		height: 0,
		weight: 0,
		emblemColor: .red
	) {
		didSet {
			BoxerData.shared.update(boxer)
		}
	}
	
}
