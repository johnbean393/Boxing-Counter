//
//  Extension+Color.swift
//  Boxing Counter
//
//  Created by Bean John on 17/6/2024.
//

import SwiftUI

extension Color {
	
	// Luminance computed property
	private var luminance: Double {
		// Convert SwiftUI Color to NSColor to CIColor
		let nsColor: NSColor = NSColor(self)
		let ciColor: CIColor = CIColor(color: nsColor)!
		
		// Extract RGB values
		var red: CGFloat = ciColor.red
		var green: CGFloat = ciColor.green
		var blue: CGFloat = ciColor.blue
		
		// Compute luminance.
		return 0.2126 * Double(red) + 0.7152 * Double(green) + 0.0722 * Double(blue)
	}
	
	// Computed property that returns most appropriate text color
	public var adaptedTextColor: Color {
		return (self.luminance > 0.5) ? Color.black : Color.white
	}
	
	
	init?(wordName: String) {
		switch wordName {
			case "clear":       self = .clear
			case "black":       self = .black
			case "white":       self = .white
			case "gray":        self = .gray
			case "red":         self = .red
			case "green":       self = .green
			case "blue":        self = .blue
			case "orange":      self = .orange
			case "yellow":      self = .yellow
			case "pink":        self = .pink
			case "purple":      self = .purple
			case "primary":     self = .primary
			case "secondary":   self = .secondary
			default:            return nil
		}
	}
	
}
