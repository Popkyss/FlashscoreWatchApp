//
//  NotificationModel+General2.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

extension NotificationModel {

	struct General2: Decodable {
		let aps: NotificationModel.Aps
		let custom: NotificationModel.Custom2?
	}

	struct Custom2: Decodable {
		let param2: String?
	}

}
