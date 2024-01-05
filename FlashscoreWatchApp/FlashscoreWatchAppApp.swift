//
//  FlashscoreWatchAppApp.swift
//  FlashscoreWatchApp
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

@main
struct FlashscoreWatchAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		#if os(watchOS)
		WKNotificationScene(
			controller: NotificationController1.self,
			category: "flashscoreIdentifier1"
		)
		WKNotificationScene(
			controller: NotificationController2.self,
			category: "flashscoreIdentifier2"
		)
		WKNotificationScene(
			controller: NotificationController3.self,
			category: "flashscoreIdentifier3"
		)
		#endif
    }
}
