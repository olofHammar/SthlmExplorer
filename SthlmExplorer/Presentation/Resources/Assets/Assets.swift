// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Colors {
    internal enum Background {
      internal static let b100 = ColorAsset(name: "Colors/Background/B100")
      internal static let b200 = ColorAsset(name: "Colors/Background/B200")
      internal static let b300 = ColorAsset(name: "Colors/Background/B300")
    }
    internal enum Main {
      internal static let accent = ColorAsset(name: "Colors/Main/Accent")
      internal static let black200 = ColorAsset(name: "Colors/Main/Black200")
      internal static let black300 = ColorAsset(name: "Colors/Main/Black300")
      internal static let gray100 = ColorAsset(name: "Colors/Main/Gray100")
      internal static let info = ColorAsset(name: "Colors/Main/Info")
      internal static let primary = ColorAsset(name: "Colors/Main/Primary")
      internal static let secondary = ColorAsset(name: "Colors/Main/Secondary")
      internal static let success = ColorAsset(name: "Colors/Main/Success")
    }
    internal enum NavigationBar {
      internal static let primary = ColorAsset(name: "Colors/NavigationBar/Primary")
      internal static let secondary = ColorAsset(name: "Colors/NavigationBar/Secondary")
    }
  }
  internal enum Images {
    internal enum Home {
      internal static let logo = ImageAsset(name: "Images/Home/logo")
    }
    internal enum Icons {
      internal static let bank = ImageAsset(name: "Images/Icons/bank")
      internal static let binocularsFill = ImageAsset(name: "Images/Icons/binoculars.fill")
      internal static let binoculars = ImageAsset(name: "Images/Icons/binoculars")
      internal static let chevronBackward = ImageAsset(name: "Images/Icons/chevron.backward")
      internal static let crown = ImageAsset(name: "Images/Icons/crown")
      internal static let ferry = ImageAsset(name: "Images/Icons/ferry")
      internal static let figureWalk = ImageAsset(name: "Images/Icons/figure.walk")
      internal static let flag = ImageAsset(name: "Images/Icons/flag")
      internal static let forkKnife = ImageAsset(name: "Images/Icons/fork.knife")
      internal static let heartFill = ImageAsset(name: "Images/Icons/heart.fill")
      internal static let heart = ImageAsset(name: "Images/Icons/heart")
      internal static let info = ImageAsset(name: "Images/Icons/info")
      internal static let leaf = ImageAsset(name: "Images/Icons/leaf")
      internal static let locationFill = ImageAsset(name: "Images/Icons/location.fill")
      internal static let location = ImageAsset(name: "Images/Icons/location")
      internal static let magnifyingglass = ImageAsset(name: "Images/Icons/magnifyingglass")
      internal static let map = ImageAsset(name: "Images/Icons/map")
      internal static let pin = ImageAsset(name: "Images/Icons/pin")
      internal static let playFill = ImageAsset(name: "Images/Icons/play.fill")
      internal static let play = ImageAsset(name: "Images/Icons/play")
      internal static let rosette = ImageAsset(name: "Images/Icons/rosette")
      internal static let share = ImageAsset(name: "Images/Icons/share")
      internal static let sliderVertical3 = ImageAsset(name: "Images/Icons/slider.vertical.3")
      internal static let squareAndArrowUp = ImageAsset(name: "Images/Icons/square.and.arrow.up")
      internal static let stopFill = ImageAsset(name: "Images/Icons/stop.fill")
      internal static let stop = ImageAsset(name: "Images/Icons/stop")
      internal static let tCircleFill = ImageAsset(name: "Images/Icons/t.circle.fill")
      internal static let tCircle = ImageAsset(name: "Images/Icons/t.circle")
      internal static let tramFill = ImageAsset(name: "Images/Icons/tram.fill")
      internal static let tram = ImageAsset(name: "Images/Icons/tram")
      internal static let xmark = ImageAsset(name: "Images/Icons/xmark")
    }
    internal enum SketchImages {
      internal static let arrowCurly = ImageAsset(name: "Images/SketchImages/arrow-curly")
      internal static let arrowLeftStripe = ImageAsset(name: "Images/SketchImages/arrow-left-stripe")
      internal static let arrowLeftThick = ImageAsset(name: "Images/SketchImages/arrow-left-thick")
      internal static let arrowLeft = ImageAsset(name: "Images/SketchImages/arrow-left")
      internal static let arrowRightThick = ImageAsset(name: "Images/SketchImages/arrow-right-thick")
      internal static let arrowSmall = ImageAsset(name: "Images/SketchImages/arrow-small")
      internal static let arrowThickLeft = ImageAsset(name: "Images/SketchImages/arrow-thick-left")
      internal static let arrowWide = ImageAsset(name: "Images/SketchImages/arrow-wide")
      internal static let dottedFrame = ImageAsset(name: "Images/SketchImages/dotted-frame")
      internal static let dottedLine = ImageAsset(name: "Images/SketchImages/dotted-line")
      internal static let magnifyingglass = ImageAsset(name: "Images/SketchImages/magnifyingglass")
      internal static let rectangle = ImageAsset(name: "Images/SketchImages/rectangle")
      internal static let thumbUp = ImageAsset(name: "Images/SketchImages/thumb-up")
      internal static let underlineThin = ImageAsset(name: "Images/SketchImages/underline-thin")
      internal static let underlineTwo = ImageAsset(name: "Images/SketchImages/underline-two")
      internal static let underlineWind = ImageAsset(name: "Images/SketchImages/underline-wind")
      internal static let underline = ImageAsset(name: "Images/SketchImages/underline")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
