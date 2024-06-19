//
//  ScoreboardTopBarView.swift
//  Boxing Counter
//
//  Created by Bean John on 19/6/2024.
//

import SwiftUI

struct ScoreboardTopBarView: View {
	
	@EnvironmentObject private var scoreboardViewController: ScoreboardViewController
	
	var boxer1Color: Color {
		return scoreboardViewController.match!.boxer1.emblemColor.color
	}
	var boxer2Color: Color {
		return scoreboardViewController.match!.boxer2.emblemColor.color
	}
	
	var boxer1Name: String {
		return scoreboardViewController.match!.boxer1.name
	}
	var boxer2Name: String {
		return scoreboardViewController.match!.boxer2.name
	}
	
    var body: some View {
		ZStack(alignment: .top) {
			trapezoid
			versus
		}
    }
	
	var trapezoid: some View {
		HStack(spacing: 0) {
			Trapezoid(insetPercent: 0.2)
				.fill(boxer1Color)
				.overlay(alignment: .trailing) {
					Trapezoid(insetPercent: 0.2)
						.foregroundStyle(Color.white)
						.overlay {
							Text(boxer1Name)
								.font(.system(size: 40))
								.bold()
								.colorInvert()
						}
						.padding(.leading, 100)
				}
			Trapezoid(insetPercent: 0.2)
				.fill(boxer2Color)
				.overlay(alignment: .leading) {
					Trapezoid(insetPercent: 0.2)
						.foregroundStyle(Color.white)
						.overlay {
							Text(boxer2Name)
								.font(.system(size: 40))
								.bold()
								.colorInvert()
								.scaleEffect(x: -1)
						}
						.padding(.leading, 100)
				}
				.scaleEffect(x: -1)
		}
		.frame(height: 70)
	}
	
	var versus: some View {
		Circle()
			.foregroundStyle(Color.white)
			.shadow(radius: 5)
			.frame(width: 120, height: 120)
			.overlay {
				Text("VS")
					.font(.system(size: 45))
					.bold()
					.colorInvert()
			}
	}
	
}

#Preview {
    ScoreboardTopBarView()
}
