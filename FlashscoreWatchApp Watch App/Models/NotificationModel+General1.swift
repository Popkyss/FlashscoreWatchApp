//
//  NotificationModel+General1.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

extension NotificationModel {

	struct General1: Decodable {
		let aps: NotificationModel.Aps
		let custom: NotificationModel.Custom1?
	}

	struct Custom1: Decodable {
		let param1: String?
	}

}
