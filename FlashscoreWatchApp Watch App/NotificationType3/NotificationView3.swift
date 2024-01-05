//
//  NotificationView3.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct NotificationView3: View {
	var title: String?

	var body: some View {
		VStack {
			Text(title ?? "Unknown Livesport")
			Divider()
			Image(systemName: "3.circle")
			Divider()
			Text("Rich Notification 3")
		}
	}
}

#Preview {
	NotificationView3(title: "Custom text")
}
