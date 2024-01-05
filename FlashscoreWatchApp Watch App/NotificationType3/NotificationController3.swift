//
//  NotificationController3.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController3: WKUserNotificationHostingController<NotificationView3> {
	var title: String?

	override var body: NotificationView3 {
		NotificationView3(title: title)
	}

	override func didReceive(_ notification: UNNotification) {
		let notificationData = notification.request.content.userInfo as? [String: Any]

		let aps = notificationData?["aps"] as? [String: Any]
		let alert = aps?["alert"] as? [String: Any]

		title = alert?["title"] as? String
	}
}
