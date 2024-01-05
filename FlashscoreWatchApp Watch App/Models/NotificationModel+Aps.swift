//
//  NotificationModel+Aps.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import Foundation


extension NotificationModel {

	struct Aps: Decodable {
		let therad_id: String
		let category: String
		let alert: NotificationModel.Alert

		enum CodingKeys: String, CodingKey {
			case therad_id = "thread-id"
			case category
			case alert
		}
	}
}

extension NotificationModel {

	struct Alert: Decodable {
		let title: String
		let body: String
	}
}


struct NotificationModelGeneral1: Decodable {
	let aps: NotificationModel.Aps
	let custom: NotificationModelCustom1
}

struct NotificationModelCustom1: Decodable {
	let param1: String?
}
