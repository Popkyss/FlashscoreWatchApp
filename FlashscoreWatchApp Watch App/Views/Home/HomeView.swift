//
//  HomeView.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct HomeView: View {

	struct FavoriteModel {
		let sectionName: String
		let date: String
		let content: RowModel
	}

	struct NewsSection {
		let sectionName: String
		let content: NewsModel
	}

	struct NewsModel {
		let values: [ArticleModel]
	}

	struct ArticleModel {
		let image: String
		let content: String
	}

	struct HomeModel {
		let favoriteModel: FavoriteModel?
		let newsModel: NewsSection?
	}

	let model: HomeModel

	var body: some View {
		VStack(spacing: 0) {
			if let _ = model.favoriteModel {
				Text("Favorites")
			}
			if let _ = model.newsModel {
				Text("News")
			}
		}
	}
}

#Preview {
	HomeView(
		model: .init(
			favoriteModel: nil,
			newsModel: nil
		)
	)
}
