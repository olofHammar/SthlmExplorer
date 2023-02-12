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
      /// Inga matchande platser hittades
      internal static let title = L10n.tr("Localizable", "home.emptyList.title", fallback: "Inga matchande platser hittades")
      internal enum Favorites {
        /// Inga platser har lagts till 
        ///  till din favoritlista än
        internal static let message = L10n.tr("Localizable", "home.emptyList.favorites.message", fallback: "Inga platser har lagts till \n till din favoritlista än")
      }
    }
    internal enum SearchBar {
      /// Sök efter platser
      internal static let title = L10n.tr("Localizable", "home.searchBar.title", fallback: "Sök efter platser")
    }
    internal enum Welcome {
      /// Här hittar du platser värda ett besök när du utforskar Stockholms stad
      internal static let message = L10n.tr("Localizable", "home.welcome.message", fallback: "Här hittar du platser värda ett besök när du utforskar Stockholms stad")
      /// Välkommen till Stockholm Explorer
      internal static let title = L10n.tr("Localizable", "home.welcome.title", fallback: "Välkommen till Stockholm Explorer")
    }
  }
  internal enum LocationDetail {
    internal enum About {
      /// Om
      internal static let title = L10n.tr("Localizable", "locationDetail.about.title", fallback: "Om")
    }
    internal enum Button {
      /// En kort historia
      internal static let history = L10n.tr("Localizable", "locationDetail.button.history", fallback: "En kort historia")
    }
    internal enum OpeningHours {
      /// Öppettider
      internal static let title = L10n.tr("Localizable", "locationDetail.openingHours.title", fallback: "Öppettider")
    }
    internal enum Tags {
      /// Bra om du gillar
      internal static let title = L10n.tr("Localizable", "locationDetail.tags.title", fallback: "Bra om du gillar")
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
      /// Välkommen till,
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.all.headerCaption", fallback: "Välkommen till,")
      /// Stockholm
      internal static let headerTitle = L10n.tr("Localizable", "locationFilter.all.headerTitle", fallback: "Stockholm")
      /// alla
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.all.searchKey", fallback: "alla")
      /// ALLA
      internal static let title = L10n.tr("Localizable", "locationFilter.all.title", fallback: "ALLA")
    }
    internal enum Favorites {
      /// Dina Favoriter
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.favorites.headerCaption", fallback: "Dina Favoriter")
      /// favoriter
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.favorites.searchKey", fallback: "favoriter")
      /// FAVORITER
      internal static let title = L10n.tr("Localizable", "locationFilter.favorites.title", fallback: "FAVORITER")
    }
    internal enum Landmark {
      /// Utforska landmärken
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.landmark.headerCaption", fallback: "Utforska landmärken")
      /// landmärken
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.landmark.searchKey", fallback: "landmärken")
      /// LANDMÄRKEN
      internal static let title = L10n.tr("Localizable", "locationFilter.landmark.title", fallback: "LANDMÄRKEN")
    }
    internal enum Museum {
      /// Utforska Museum
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.museum.headerCaption", fallback: "Utforska Museum")
      /// museum
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.museum.searchKey", fallback: "museum")
      /// MUSEUMS
      internal static let title = L10n.tr("Localizable", "locationFilter.museum.title", fallback: "MUSEUMS")
    }
    internal enum ScenicView {
      /// Utforska natursköna promenader
      internal static let headerCaption = L10n.tr("Localizable", "locationFilter.scenicView.headerCaption", fallback: "Utforska natursköna promenader")
      /// scenisk utsikt
      internal static let searchKey = L10n.tr("Localizable", "locationFilter.scenicView.searchKey", fallback: "scenisk utsikt")
      /// SCENISK UTSIKT
      internal static let title = L10n.tr("Localizable", "locationFilter.scenicView.title", fallback: "SCENISK UTSIKT")
    }
  }
  internal enum Map {
    internal enum Directions {
      internal enum Completed {
        /// Du har nått din destination
        internal static let message = L10n.tr("Localizable", "map.directions.completed.message", fallback: "Du har nått din destination")
      }
      internal enum LocationNotAvailable {
        /// Uppdatera din platsbehörighet för att aktivera vägbeskrivningar.
        internal static let message = L10n.tr("Localizable", "map.directions.locationNotAvailable.message", fallback: "Uppdatera din platsbehörighet för att aktivera vägbeskrivningar.")
      }
      internal enum Route {
        /// Din destination är %@ min bort
        internal static func message(_ p1: Any) -> String {
          return L10n.tr("Localizable", "map.directions.route.message", String(describing: p1), fallback: "Din destination är %@ min bort")
        }
      }
    }
  }
  internal enum MapSheet {
    /// Få vägbeskrivningar
    internal static let getDirections = L10n.tr("Localizable", "mapSheet.getDirections", fallback: "Få vägbeskrivningar")
    internal enum Info {
      /// Läs mer
      internal static let title = L10n.tr("Localizable", "mapSheet.info.title", fallback: "Läs mer")
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
    /// LISTA
    internal static let list = L10n.tr("Localizable", "tabbar.list", fallback: "LISTA")
    /// KARTA
    internal static let map = L10n.tr("Localizable", "tabbar.map", fallback: "KARTA")
  }
  internal enum TravelTipCard {
    /// Resetips
    internal static let title = L10n.tr("Localizable", "travelTipCard.title", fallback: "Resetips")
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
