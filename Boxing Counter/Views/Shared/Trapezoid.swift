//
//  Trapezoid.swift
//  Center Stage Scoreboard
//
//  Created by Bean John on 30/1/2024.
//

import SwiftUI

struct Trapezoid: Shape {
	
	var insetPercent: Double
	
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: rect.minX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX - (rect.width * (1 - insetPercent)), y: rect.maxY))
		path.closeSubpath()
		
		return path
	}
	
}

#Preview {
	Trapezoid(insetPercent: 0.3)
		.fill(Color.accentColor)
}
