// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Home {
    internal enum EmptyList {
      /// No matching locations found
      internal static let title = L10n.tr("Localizable", "home.emptyList.title", fallback: "No matching locations found")
      internal enum Favorites {
        /// No locations have been added 
        ///  to your favorite list yet
        internal static let message = L10n.tr("Localizable", "home.emptyList.favorites.message", fallback: "No locations have been added \n to your favorite list yet")
      }
    }
    internal enum SearchBar {
      /// Search Locations
      internal static let title = L10n.tr("Localizable", "home.searchBar.title", fallback: "Search Locations")
    }
    internal enum Welcome {
      /// Here you will find locations worth a visit when exploring the city of Stockholm
      internal static let message = L10n.tr("Localizable", "home.welcome.message", fallback: "Here you will find locations worth a visit when exploring the city of Stockholm")
      /// Welcome to Stockholm Explorer
      internal static let title = L10n.tr("Localizable", "home.welcome.title", fallback: "Welcome to Stockholm Explorer")
    }
  }
  internal enum LocationDetail {
    internal enum About {
      /// About
      internal static let title = L10n.tr("Localizable", "locationDetail.about.title", fallback: "About")
    }
    internal enum Button {
      /// A Brief History
      internal static let history = L10n.tr("Localizable", "locationDetail.button.history", fallback: "A Brief History")
    }
    internal enum OpeningHours {
      /// Opening hours
      internal static let title = L10n.tr("Localizable", "locationDetail.openingHours.title", fallback: "Opening hours")
    }
    internal enum Tags {
      /// Great if you like
      internal static let title = L10n.tr("Localizable", "locationDetail.tags.title", fallback: "Great if you like")
    }
    internal enum Walk {
      /// N/A
      internal static let notAvailable = L10n.tr("Localizable", "locationDetail.walk.notAvailable", fallback: "N/A")
      /// %@ min
      internal static func title(_ p1: Any) -> String {
        return L10n.tr("Localizable", "locationDetail.walk.title", String(describing: p1), fallback: "%@ min")
      }
    }
  }
  internal enum LocationFilter {
    internal enum All {
      /// Welcome to
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.all.headerCaption", fallback: "Welcome to")
      /// Stockholm
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.all.headerTitle", fallback: "Stockholm")
      /// all
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.all.searchKey", fallback: "all")
      /// ALL
      internal static let title = L10n.tr("Localizable", "locationFilter.all.title", fallback: "ALL")
    }
    internal enum Explore {
      /// Explore
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.explore.headerCaption", fallback: "Explore")
    }
    internal enum Favorites {
      /// Your
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.favorites.headerCaption", fallback: "Your")
      /// Favorites
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.favorites.headerTitle", fallback: "Favorites")
      /// favorite
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.favorites.searchKey", fallback: "favorite")
      /// FAVORITES
      internal static let title = L10n.tr("Localizable", "locationFilter.favorites.title", fallback: "FAVORITES")
    }
    internal enum Landmark {
      /// Landmarks
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.landmark.headerTitle", fallback: "Landmarks")
      /// landmark
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.landmark.searchKey", fallback: "landmark")
      /// LANDMARKS
      internal static let title = L10n.tr("Localizable", "locationFilter.landmark.title", fallback: "LANDMARKS")
    }
    internal enum Museum {
      /// Museums
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.museum.headerTitle", fallback: "Museums")
      /// museum
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.museum.searchKey", fallback: "museum")
      /// MUSEUMS
      internal static let title = L10n.tr("Localizable", "locationFilter.museum.title", fallback: "MUSEUMS")
    }
    internal enum ScenicView {
      /// Scenic Views
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.scenicView.headerTitle", fallback: "Scenic Views")
      /// scenicview
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.scenicView.searchKey", fallback: "scenicview")
      /// SCENIC VIEWS
      internal static let title = L10n.tr("Localizable", "locationFilter.scenicView.title", fallback: "SCENIC VIEWS")
    }
  }
  internal enum Map {
    internal enum Directions {
      internal enum Completed {
        /// You have reached your destination
        internal static let message = L10n.tr("Localizable", "map.directions.completed.message", fallback: "You have reached your destination")
      }
      internal enum LocationNotAvailable {
        /// Update you location persmission to enable directions.
        internal static let message = L10n.tr("Localizable", "map.directions.locationNotAvailable.message", fallback: "Update you location persmission to enable directions.")
      }
      internal enum Route {
        /// Your destination is %@ min away
        internal static func message(_ p1: Any) -> String {
          return L10n.tr("Localizable", "map.directions.route.message", String(describing: p1), fallback: "Your destination is %@ min away")
        }
      }
    }
  }
  internal enum MapSheet {
    /// Get Directions
    internal static let getDirections = L10n.tr("Localizable", "mapSheet.getDirections", fallback: "Get Directions")
    internal enum Info {
      /// Close
      internal static let close = L10n.tr("Localizable", "mapSheet.info.close", fallback: "Close")
      /// Read More
      internal static let readMore = L10n.tr("Localizable", "mapSheet.info.readMore", fallback: "Read More")
    }
  }
  internal enum Root {
    /// Localizable.strings
    ///   SthlmExplorer
    /// 
    ///   Created by Olof Hammar on 2023-02-09.
    internal static let title = L10n.tr("Localizable", "root.title", fallback: "Root view")
  }
  internal enum Tabbar {
    /// LIST
    internal static let list = L10n.tr("Localizable", "tabbar.list", fallback: "LIST")
    /// MAP
    internal static let map = L10n.tr("Localizable", "tabbar.map", fallback: "MAP")
  }
  internal enum TravelTipCard {
    /// Travel Tip
    internal static let title = L10n.tr("Localizable", "travelTipCard.title", fallback: "Travel Tip")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
