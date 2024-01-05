//
//  FavoritesView.swift
//  FlashscoreWatchApp Watch App
//
//  Created by Jan Pokorný on 05.01.2024.
//

import SwiftUI

struct FavoritesView: View {

	let model: [RowModel]

	var body: some View {
		VStack(spacing: 6) {
			ForEach(model, id: \.id) { row in
				Button(action: {}) {
					detailRow(model: row)
				}
				.buttonStyle(.plain)
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
		.frame(height: 44)
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
			text(time, .text)

		case .live(let homeScore, let awayScore, let time):
			score(homeScore: homeScore, awayScore: awayScore, label: time)
				.foregroundColor(.red)

		case .finished(let homeScore, let awayScore, let stage):
			score(homeScore: homeScore, awayScore: awayScore, label: stage)
				.foregroundColor(.white)
		}
	}

	@ViewBuilder
	private func score(homeScore: String, awayScore: String, label: String) -> some View {
		VStack(spacing: 1) {
			HStack(spacing: 4) {
				text(homeScore, .score)
				text("-", .score)
				text(awayScore, .score)
			}
			text(label, .text)
		}
	}

	@ViewBuilder
	private func text(_ text: String, _ fontType: FontType) -> some View {
		let fontValue = getFont(fontType)
		let font = fontValue.uiFont
		let lineHeight = fontValue.lineHeight

		Text(text)
			.font(Font(font))
			.lineSpacing(lineHeight - font.lineHeight)
			.padding(.vertical, (lineHeight - font.lineHeight) / 2)
	}

	private enum FontType {
		case score, text
	}

	private func getFont(_ textType: FontType) -> (uiFont: UIFont, lineHeight: CGFloat) {
		switch textType {
		case .text:
			return (
				UIFont.systemFont(ofSize: 13, weight: UIFont.Weight(rawValue: 400)), 15.5)

		case .score:
			return (UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(rawValue: 700)), 18.5)
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
			),
			.init(
				id: UUID(),
				homeImage: "bolt.horizontal.circle",
				awayImage: "bolt.horizontal.circle.fill",
				middleValue: .live("2", "1", "34'")
			),
			.init(
				id: UUID(),
				homeImage: "bolt.horizontal.circle.fill",
				awayImage: "bolt.horizontal.circle",
				middleValue: .prematch("18:00")
			)
		]
	)
}

struct RowModel: Identifiable {
	let id: UUID
	let homeImage: String
	let awayImage: String
	let middleValue: MiddleValue
}

enum MiddleValue {
	case prematch(String)
	case live(String, String, String)
	case finished(String, String, String)
}
