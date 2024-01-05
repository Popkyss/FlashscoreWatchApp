//
//  NotificationModel+General3.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

extension NotificationModel {

	struct General3: Decodable {
		let aps: NotificationModel.Aps
		let custom: NotificationModel.Custom3?
	}

	struct Custom3: Decodable {
		let param3: String?
	}

}
