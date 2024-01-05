//
//  NotificationView1.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct NotificationView1: View {
	var title: String?

	var body: some View {
		VStack {
			Text(title ?? "Unknown Livesport")
			Divider()
			Image(systemName: "1.circle")
			Divider()
			Text("Rich Notification 1")
		}
	}
}

#Preview {
	NotificationView1(title: "Custom text")
}
