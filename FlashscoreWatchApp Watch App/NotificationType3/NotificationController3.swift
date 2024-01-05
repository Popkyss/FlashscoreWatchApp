//
//  NotificationController3.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI
import UserNotifications

class NotificationController3: WKUserNotificationHostingController<NotificationView3> {
	var title: String?

	override var body: NotificationView3 {
		NotificationView3(title: title)
	}

	override func didReceive(_ notification: UNNotification) {
		guard let model = decodeNotification(from: notification.request) else { return }
		title = model.aps.alert.title
	}

	private func decodeNotification(from request: UNNotificationRequest) -> NotificationModel.General3? {
		let decoder = JSONDecoder()
		return try? decoder.decode(
			NotificationModel.General3.self,
			from: JSONSerialization.data(withJSONObject: request.content.userInfo)
		)
	}
}
