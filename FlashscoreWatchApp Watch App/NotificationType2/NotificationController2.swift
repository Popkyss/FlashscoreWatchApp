//
//  NotificationController2.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController2: WKUserNotificationHostingController<NotificationView2> {
	var title: String?

	override var body: NotificationView2 {
		NotificationView2(title: title)
	}

	override func didReceive(_ notification: UNNotification) {
		let notificationData = notification.request.content.userInfo as? [String: Any]

		let aps = notificationData?["aps"] as? [String: Any]
		let alert = aps?["alert"] as? [String: Any]

		title = alert?["title"] as? String
	}
}
