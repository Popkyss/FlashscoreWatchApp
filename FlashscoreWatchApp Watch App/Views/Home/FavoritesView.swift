//
//  FavoritesView.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct FavoritesView: View {

	struct RowModel: Identifiable {
		let id: UUID
		let homeImage: String
		let awayImage: String
		let middleValue: MiddleValue
	}

	enum MiddleValue {
		case prematch(String)
		case live(String, String, String, String)
		case finished(String, String, String)
	}

	let model: [RowModel]

	var body: some View {
		VStack(spacing: 8) {
			ForEach(model, id: \.id) { row in
				detailRow(model: row)
			}
		}
	}

	@ViewBuilder
	private func detailRow(model: RowModel) -> some View {
		HStack(spacing: 0) {
			logoImage(image: model.homeImage)
			Spacer(minLength: 0)
			middleValue(model: model.middleValue)
			Spacer(minLength: 0)
			logoImage(image: model.awayImage)
		}
		.padding(.horizontal, 8)
		.padding(.vertical, 6)
		.background(.blue)
		.cornerRadius(9)
	}

	@ViewBuilder
	private func logoImage(image: String) -> some View {
		Image(systemName: image)
			.frame(width: 32, height: 32)
			.foregroundColor(.black)
			.background(.white)
			.cornerRadius(8)
	}

	@ViewBuilder
	private func middleValue(model: MiddleValue) -> some View {
		switch model {
		case .prematch(let time):
			text(time)

		case .live(let homeScore, let awayScore, let time, let stage):
			VStack(spacing: 8) {
				HStack(spacing: 8) {
					Text(homeScore)
					Text("-")
					Text(awayScore)
				}
				Text(time)
				Text(stage)
			}
			.foregroundColor(.red)

		case .finished(let homeScore, let awayScore, let stage):
			VStack(spacing: 8) {
				HStack(spacing: 8) {
					Text(homeScore)
					Text("-")
					Text(awayScore)
				}
				Text(stage)
			}
		}
	}

	@ViewBuilder
	private func text(_ text: String) -> some View {
		let fontValue = getFont(.score)
		let font = fontValue.uiFont
		let lineHeight = fontValue.lineHeight

		Text(text)
			.font(Font(font))
			.lineSpacing(lineHeight - font.lineHeight)
			.padding(.vertical, (lineHeight - font.lineHeight) / 2)
	}

	private enum FontType {
		case score, stage
	}

	private func getFont(_ textType: FontType) -> (uiFont: UIFont, lineHeight: CGFloat) {
		switch textType {
		case .score:
			return (UIFont.fs.regular(13), 15.5)

		case .stage:
			return (UIFont.fs.regular(13), 15.5)
		}
	}
}

#Preview {
	FavoritesView(
		model: [
			.init(
				id: UUID(),
				homeImage: "bolt.horizontal.circle.fill",
				awayImage: "bolt.horizontal.circle",
				middleValue: .prematch("18:00")
			)
		]
	)
}
