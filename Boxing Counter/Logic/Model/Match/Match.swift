//
//  Match.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation

struct Match: Codable, Identifiable, Hashable {
	
	var id: UUID = UUID()
	
	var boxer1Id: UUID
	var boxer1: Boxer {
		get {
			return BoxerData.shared.values.filter({ $0.id == boxer1Id }).first!
		}
		set {
			boxer1Id = newValue.id
		}
	}
	var boxer1Score: Int = 0
	
	var boxer2Id: UUID
	var boxer2: Boxer {
		get {
			return BoxerData.shared.values.filter({ $0.id == boxer2Id }).first!
		}
		set {
			boxer2Id = newValue.id
		}
	}
	var boxer2Score: Int = 0
	
	var name: String {
		return "\(boxer1.name) vs \(boxer2.name)"
	}
	
	var roundMins: Int
	var restMins: Int
	var rounds: Int
	
	var totalTimeSecs: Int {
		return (roundMins * rounds + restMins * (rounds - 1)) * 60
	}
	
	var winner: Boxer {
		return boxer1Score >= boxer2Score ? boxer1 : boxer2
	}
	
	var roundsCompleted: Int = 0
	var roundsRemaining: Int {
		return rounds - roundsCompleted
	}
	var complete: Bool {
		return roundsRemaining <= 0
	}
	
	static let example: Match = Match(
		boxer1Id: exampleBoxer1.id,
		boxer2Id: exampleBoxer2.id,
		roundMins: 2,
		restMins: 1,
		rounds: 2
	)
	
	private static let exampleBoxer1: Boxer = Boxer(
		name: "Patton",
		nickname: "BLOB",
		height: 180,
		weight: 300,
		emblemColor: .blue
	)
	private static let exampleBoxer2: Boxer = Boxer(
		name: "Max",
		nickname: "LINE",
		height: 170,
		weight: 180,
		emblemColor: .blue
	)
	
}
