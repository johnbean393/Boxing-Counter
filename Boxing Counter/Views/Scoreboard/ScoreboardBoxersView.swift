//
//  ScoreboardBoxersView.swift
//  Boxing Counter
//
//  Created by Bean John on 19/6/2024.
//

import SwiftUI

struct ScoreboardBoxersView: View {
	
	@EnvironmentObject private var scoreboardViewController: ScoreboardViewController
	
    var body: some View {
		HStack {
			Rectangle()
				.opacity(0.0001)
				.overlay {
					boxer1Visualization
				}
			Divider()
			Rectangle()
				.opacity(0.0001)
				.overlay {
					boxer2Visualization
				}
		}
    }
	
	var boxer1Visualization: some View {
		return scoreboardViewController.match!.boxer1.visualization
	}
	
	var boxer2Visualization: some View {
		return scoreboardViewController.match!.boxer2.visualization
	}
	
}

#Preview {
    ScoreboardBoxersView()
}
