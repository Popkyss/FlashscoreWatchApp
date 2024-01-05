//
//  HomeView.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI
import UserNotifications

struct HomeView: View {
	var body: some View {
		VStack(spacing: 8) {
			detailRow()
		}
	}

	@ViewBuilder
	private func detailRow() -> some View {
		HStack(spacing: 0) {
			Image(systemName: "apple.logo")
			Text("18:00")
			Image(systemName: "apple.logo")
		}
	}
}

#Preview {
	HomeView()
}
