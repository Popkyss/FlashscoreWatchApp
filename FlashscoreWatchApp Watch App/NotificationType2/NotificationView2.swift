//
//  NotificationView2.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct NotificationView2: View {
	var title: String?

	var body: some View {
		VStack {
			Text(title ?? "Unknown Livesport")
			Divider()
			Image(systemName: "2.circle")
			Divider()
			Text("Rich Notification 2")
		}
	}
}

#Preview {
	NotificationView2(title: "Custom text")
}
