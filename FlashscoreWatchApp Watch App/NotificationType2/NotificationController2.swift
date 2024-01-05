//
//  NotificationController2.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI
import UserNotifications

class NotificationController2: WKUserNotificationHostingController<NotificationView2> {
	var title: String?

	override var body: NotificationView2 {
		NotificationView2(title: title)
	}

	override func didReceive(_ notification: UNNotification) {
		guard let model = decodeNotification(from: notification.request) else { return }
		title = model.aps.alert.title

		let doneAction = UNNotificationAction(
			identifier: "button.done",
			title: "Done",
			options: .foreground
		)
		let category = UNNotificationCategory(
			identifier: model.aps.category,
			actions: [doneAction],
			intentIdentifiers: [],
			options: []
		)
		UNUserNotificationCenter
			.current()
			.setNotificationCategories([category])
	}

	private func decodeNotification(from request: UNNotificationRequest) -> NotificationModel.General2? {
		let decoder = JSONDecoder()
		return try? decoder.decode(
			NotificationModel.General2.self,
			from: JSONSerialization.data(withJSONObject: request.content.userInfo)
		)
	}
}
