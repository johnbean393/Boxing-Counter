//
//  AccountEditorViewModel.swift
//  Boxing Counter
//
//  Created by Bean John on 18/6/2024.
//

import Foundation
import SwiftUI

class AccountEditorViewModel: ObservableObject {
	
	static let shared: AccountEditorViewModel = AccountEditorViewModel()
	
	@Published var account: Account = Account() {
		didSet {
			AccountData.shared.update(account)
		}
	}
	
}
