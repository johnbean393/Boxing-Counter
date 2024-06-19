//
//  ScoreboardBottomBarView.swift
//  Boxing Counter
//
//  Created by Bean John on 19/6/2024.
//

import SwiftUI

struct ScoreboardBottomBarView: View {
	
	@EnvironmentObject private var scoreboardViewController: ScoreboardViewController
	
	var boxer1Score: Int {
		return scoreboardViewController.match!.boxer1Score
	}
	var boxer2Score: Int {
		return scoreboardViewController.match!.boxer2Score
	}
	
	var boxer1Color: Color {
		return scoreboardViewController.match!.boxer1.emblemColor.color
	}
	var boxer2Color: Color {
		return scoreboardViewController.match!.boxer2.emblemColor.color
	}
	
    var body: some View {
        trapezoid
    }
	
	var trapezoid: some View {
		HStack(spacing: 0) {
			Trapezoid(insetPercent: 0.2)
				.fill(boxer1Color)
				.overlay(alignment: .trailing) {
					Trapezoid(insetPercent: 0.2)
						.foregroundStyle(Color.white)
						.padding(.leading, 100)
				}
			Trapezoid(insetPercent: 0.2)
				.fill(boxer2Color)
				.overlay(alignment: .leading) {
					Trapezoid(insetPercent: 0.2)
						.foregroundStyle(Color.white)
						.padding(.leading, 100)
				}
				.scaleEffect(x: -1)
		}
		.frame(height: 70)
		.scaleEffect(y: -1)
	}
	
}

#Preview {
    ScoreboardBottomBarView()
}
