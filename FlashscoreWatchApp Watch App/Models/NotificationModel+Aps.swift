//
//  NotificationModel+Aps.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

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
