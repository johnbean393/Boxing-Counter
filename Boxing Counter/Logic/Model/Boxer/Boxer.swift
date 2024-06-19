//
//  Boxer.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import Foundation
import SwiftUI

struct Boxer: Codable, Identifiable, Hashable {
	
	var id: UUID = UUID()
	var name: String
	var nickname: String
	
	var height: CGFloat
	var heightDescription: String {
		return "\(round(height * 10) / 10) cm"
	}
	
	var weight: CGFloat
	var weightDescription: String {
		return "\(round(weight * 10) / 10) lb"
	}
	
	var emblemColor: EmblemColor
	
	var weightClass: WeightClass {
		if self.weight > 200 {
			return .heavy
		} else if self.weight > 100 {
			return .medium
		} else {
			return .light
		}
	}
	
	var visualization: some View {
		VStack(spacing: 0) {
			Image(systemName: "figure")
				.resizable()
				.frame(width: 200, height: 200 * (height/165))
			RoundedRectangle(cornerRadius: 8)
				.fill(emblemColor.color)
				.frame(width: 200, height: 35)
				.overlay {
					Text(weightClass.description)
						.bold()
						.foregroundStyle(emblemColor.color.adaptedTextColor)
				}
		}
	}
	
	enum EmblemColor: String, Codable, CaseIterable {
		
		case red, green, blue, yellow, purple, pink, orange
		
		var color: Color {
			return Color(wordName: self.rawValue)!
		}
	}
	
	enum WeightClass: String, Codable, CaseIterable {
		
		case light, medium, heavy
		
		var description: String {
			return "\(self.rawValue)weight".capitalized
		}

	}
	
}

let exampleBoxer1: Boxer = Boxer(
	name: "Patton",
	nickname: "BLOB",
	height: 180,
	weight: 300,
	emblemColor: .blue
)
let exampleBoxer2: Boxer = Boxer(
	name: "Max",
	nickname: "LINE",
	height: 170,
	weight: 180,
	emblemColor: .blue
)
