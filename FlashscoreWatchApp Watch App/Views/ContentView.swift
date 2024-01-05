//
//  ContentView.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
	var body: some View {
		HomeView()
			.task {
				let center = UNUserNotificationCenter.current()
				_ = try? await center.requestAuthorization(
					options: [.alert, .sound, .badge]
				)
			}
	}
}

#Preview {
	ContentView()
}
