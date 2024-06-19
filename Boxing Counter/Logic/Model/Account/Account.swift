//
//  Account.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation

struct Account: Identifiable, Hashable, Codable {
	
	static func == (lhs: Account, rhs: Account) -> Bool {
		return (lhs.id == rhs.id)
	}
	
	/// Identification ID of the user
	var id: UUID = UUID()
	/// Username of the user
	var username: String = ""
	/// Password of the user
	var password: Password = Password()
	/// Controls whether the user is an admin
	var isAdmin: Bool = false
	
}

struct Password: Codable, Hashable {
	
	/// Password string of the user
	var password: String = ""
	
	/// Function to validate the entered password
	static func validatePassword(_ password: String) throws {
		// List of invalid characters
		let invalidChars: [String] = [
			"\n",
			" "
		]
		// Check for invalid characters
		for invalidChar in invalidChars {
			if password.contains(invalidChar) {
				throw PasswordError.invalidCharacters
			}
		}
	}
	
	/// Enum of password errors
	enum PasswordError: Error {
		case invalidCharacters
	}
	
}
