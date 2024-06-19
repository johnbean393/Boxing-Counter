//
//  Parallelogram.swift
//  Center Stage Scoreboard
//
//  Created by Bean John on 30/1/2024.
//

import SwiftUI

struct Parallelogram: Shape {
	
	/// Describes this shape as a path within a rectangular frame of reference.
	///
	/// - Parameter rect: The frame of reference for describing this shape.
	/// - Returns: A path that describes this shape.
	public func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: (rect.midX - rect.minX) / 2, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
		path.addLine(to: CGPoint(x: ((rect.midX - rect.minX) / 2) + rect.midX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		path.closeSubpath()
		
		return path
	}
	
}

#Preview {
	Parallelogram()
}
