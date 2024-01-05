//
//  NotificationController1.swift
//  LivesportWatch Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController1: WKUserNotificationHostingController<NotificationView1> {
	var title: String?

	override var body: NotificationView1 {
		NotificationView1(title: title)
	}

	override func didReceive(_ notification: UNNotification) {
		guard let model = decodeNotification(from: notification.request) else { return }
		title = model.aps.alert.title
	}

	private func decodeNotification(from request: UNNotificationRequest) -> NotificationModel.General1? {
		let decoder = JSONDecoder()
		return try? decoder.decode(
			NotificationModel.General1.self,
			from: JSONSerialization.data(withJSONObject: request.content.userInfo)
		)
	}
}
