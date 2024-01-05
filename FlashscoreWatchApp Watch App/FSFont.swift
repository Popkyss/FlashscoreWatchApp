import UIKit

final class LSFont: LSRegisterableFont {

	class func regular(_ size: CGFloat) -> UIFont {
		font(style: "Regular", size: size)
	}

	class func bold(_ size: CGFloat) -> UIFont {
		font(style: "Bold", size: size)
	}

	class func extrabold(_ size: CGFloat) -> UIFont {
		font(style: "Extrabold", size: size)
	}

	private class func font(style: String, size: CGFloat) -> UIFont {
		let fontName = "LivesportFinderLCGJK-" + style

		registerFontIfNeeded(fontName)

		return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
	}

}

class LSRegisterableFont: NSObject {

	private static var registeredFonts = Set<String>()

	class func registerFontIfNeeded(_ fontName: String, extension: String = "otf") {
		guard
			!registeredFonts.contains(fontName),
			let fontUrl = Bundle(for: self).url(forResource: fontName, withExtension: `extension`),
			let fontData = try? Data(contentsOf: fontUrl),
			let provider = CGDataProvider(data: fontData as CFData),
			let font = CGFont(provider)
		else {
			return
		}

		CTFontManagerRegisterGraphicsFont(font, nil)
		registeredFonts.insert(fontName)
	}

}

public final class FSFont: NSObject {

	@objc
	public class func regular(_ size: CGFloat) -> UIFont {
		LSFont.regular(size)
	}

	@objc
	public class func bold(_ size: CGFloat) -> UIFont {
		LSFont.bold(size)
	}

	@objc
	public class func extrabold(_ size: CGFloat) -> UIFont {
		LSFont.extrabold(size)
	}

	@objc
	public class func numbers(_ size: CGFloat) -> UIFont {
		LSNumbersFont.size(size)
	}
}

public extension UIFont {
	static var fs: FSFont.Type { FSFont.self }
}

final class LSNumbersFont: LSRegisterableFont {

	static func size(_ size: CGFloat) -> UIFont {
		let fontName = "FSNumbers-Regular"

		registerFontIfNeeded(fontName)

		return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size)
	}

}

