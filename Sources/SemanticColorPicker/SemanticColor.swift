import SwiftUI

/// An example enumeration of semantic colors conforming to the `ColorConvertible` protocol.
///
/// This enum provides a comprehensive set of standard colors and their opacity variants (75%, 50%, and 25%).
/// Each case is identifiable, equatable, and convertible to a SwiftUI `Color`, furnishing a localized description for display.
/// Use this enum as the data source for `SemanticColorPicker` to present a predefined palette of semantic colors.
public enum SemanticColor: String, Sendable, CaseIterable, Identifiable, ColorConvertible {
    case red
    case orange
    case yellow
    case green
    case mint
    case teal
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case red75
    case orange75
    case yellow75
    case green75
    case mint75
    case teal75
    case cyan75
    case blue75
    case indigo75
    case purple75
    case pink75
    case brown75
    case red50
    case orange50
    case yellow50
    case green50
    case mint50
    case teal50
    case cyan50
    case blue50
    case indigo50
    case purple50
    case pink50
    case brown50
    case red25
    case orange25
    case yellow25
    case green25
    case mint25
    case teal25
    case cyan25
    case blue25
    case indigo25
    case purple25
    case pink25
    case brown25

    /// The unique identifier for this color, fulfilling `Identifiable`.
    public var id: Self { self }

    /// A localized text description for the color, suitable for accessibility and display.
    public var description: String {
        switch self {
        case .red:
            return String(localized: "redColorSelection")
        case .orange:
            return String(localized: "orangeColorSelection")
        case .yellow:
            return String(localized: "yellowColorSelection")
        case .green:
            return String(localized: "greenColorSelection")
        case .mint:
            return String(localized: "mintColorSelection")
        case .teal:
            return String(localized: "tealColorSelection")
        case .cyan:
            return String(localized: "cyanColorSelection")
        case .blue:
            return String(localized: "blueColorSelection")
        case .indigo:
            return String(localized: "indigoColorSelection")
        case .purple:
            return String(localized: "purpleColorSelection")
        case .pink:
            return String(localized: "pinkColorSelection")
        case .brown:
            return String(localized: "brownColorSelection")
        case .red75:
            return String(localized: "redColorSelection75")
        case .orange75:
            return String(localized: "orangeColorSelection75")
        case .yellow75:
            return String(localized: "yellowColorSelection75")
        case .green75:
            return String(localized: "greenColorSelection75")
        case .mint75:
            return String(localized: "mintColorSelection75")
        case .teal75:
            return String(localized: "tealColorSelection75")
        case .cyan75:
            return String(localized: "cyanColorSelection75")
        case .blue75:
            return String(localized: "blueColorSelection75")
        case .indigo75:
            return String(localized: "indigoColorSelection75")
        case .purple75:
            return String(localized: "purpleColorSelection75")
        case .pink75:
            return String(localized: "pinkColorSelection75")
        case .brown75:
            return String(localized: "brownColorSelection75")
        case .red50:
            return String(localized: "redColorSelection50")
        case .orange50:
            return String(localized: "orangeColorSelection50")
        case .yellow50:
            return String(localized: "yellowColorSelection50")
        case .green50:
            return String(localized: "greenColorSelection50")
        case .mint50:
            return String(localized: "mintColorSelection50")
        case .teal50:
            return String(localized: "tealColorSelection50")
        case .cyan50:
            return String(localized: "cyanColorSelection50")
        case .blue50:
            return String(localized: "blueColorSelection50")
        case .indigo50:
            return String(localized: "indigoColorSelection50")
        case .purple50:
            return String(localized: "purpleColorSelection50")
        case .pink50:
            return String(localized: "pinkColorSelection50")
        case .brown50:
            return String(localized: "brownColorSelection50")
        case .red25:
            return String(localized: "redColorSelection25")
        case .orange25:
            return String(localized: "orangeColorSelection25")
        case .yellow25:
            return String(localized: "yellowColorSelection25")
        case .green25:
            return String(localized: "greenColorSelection25")
        case .mint25:
            return String(localized: "mintColorSelection25")
        case .teal25:
            return String(localized: "tealColorSelection25")
        case .cyan25:
            return String(localized: "cyanColorSelection25")
        case .blue25:
            return String(localized: "blueColorSelection25")
        case .indigo25:
            return String(localized: "indigoColorSelection25")
        case .purple25:
            return String(localized: "purpleColorSelection25")
        case .pink25:
            return String(localized: "pinkColorSelection25")
        case .brown25:
            return String(localized: "brownColorSelection25")
        }
    }

    /// Returns a random `SemanticColor` value from the primary palette.
    public static var random: Self {
        let randomInt: Int = Int.random(in: 0..<48)
        switch randomInt {
        case 0:
            return Self.blue
        case 1:
            return Self.brown
        case 2:
            return Self.cyan
        case 3:
            return Self.green
        case 4:
            return Self.indigo
        case 5:
            return Self.mint
        case 6:
            return Self.orange
        case 7:
            return Self.pink
        case 8:
            return Self.purple
        case 9:
            return Self.red
        case 10:
            return Self.teal
        case 11:
            return Self.yellow
        case 12:
            return Self.blue75
        case 13:
            return Self.brown75
        case 14:
            return Self.cyan75
        case 15:
            return Self.green75
        case 16:
            return Self.indigo75
        case 17:
            return Self.mint75
        case 18:
            return Self.orange75
        case 19:
            return Self.pink75
        case 20:
            return Self.purple75
        case 21:
            return Self.red75
        case 22:
            return Self.teal75
        case 23:
            return Self.yellow75
        case 24:
            return Self.blue50
        case 25:
            return Self.brown50
        case 26:
            return Self.cyan50
        case 27:
            return Self.green50
        case 28:
            return Self.indigo50
        case 29:
            return Self.mint50
        case 30:
            return Self.orange50
        case 31:
            return Self.pink50
        case 32:
            return Self.purple50
        case 33:
            return Self.red50
        case 34:
            return Self.teal50
        case 35:
            return Self.yellow50
        case 36:
            return Self.blue25
        case 37:
            return Self.brown25
        case 38:
            return Self.cyan25
        case 39:
            return Self.green25
        case 40:
            return Self.indigo25
        case 41:
            return Self.mint25
        case 42:
            return Self.orange25
        case 43:
            return Self.pink25
        case 44:
            return Self.purple25
        case 45:
            return Self.red25
        case 46:
            return Self.teal25
        case 47:
            return Self.yellow25
        default:
            return Self.yellow
        }
    }

    /// A SwiftUI `Color` representation of this semantic color.
    public var color: Color {
        switch self {
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        case .mint:
            return Color.mint
        case .teal:
            return Color.teal
        case .cyan:
            return Color.cyan
        case .blue:
            return Color.blue
        case .indigo:
            return Color.indigo
        case .purple:
            return Color.purple
        case .pink:
            return Color.pink
        case .brown:
            return Color.brown
        case .red75:
            return Color.red.opacity(0.75)
        case .orange75:
            return Color.orange.opacity(0.75)
        case .yellow75:
            return Color.yellow.opacity(0.75)
        case .green75:
            return Color.green.opacity(0.75)
        case .mint75:
            return Color.mint.opacity(0.75)
        case .teal75:
            return Color.teal.opacity(0.75)
        case .cyan75:
            return Color.cyan.opacity(0.75)
        case .blue75:
            return Color.blue.opacity(0.75)
        case .indigo75:
            return Color.indigo.opacity(0.75)
        case .purple75:
            return Color.purple.opacity(0.75)
        case .pink75:
            return Color.pink.opacity(0.75)
        case .brown75:
            return Color.brown.opacity(0.75)
        case .red50:
            return Color.red.opacity(0.5)
        case .orange50:
            return Color.orange.opacity(0.5)
        case .yellow50:
            return Color.yellow.opacity(0.5)
        case .green50:
            return Color.green.opacity(0.5)
        case .mint50:
            return Color.mint.opacity(0.5)
        case .teal50:
            return Color.teal.opacity(0.5)
        case .cyan50:
            return Color.cyan.opacity(0.5)
        case .blue50:
            return Color.blue.opacity(0.5)
        case .indigo50:
            return Color.indigo.opacity(0.5)
        case .purple50:
            return Color.purple.opacity(0.5)
        case .pink50:
            return Color.pink.opacity(0.5)
        case .brown50:
            return Color.brown.opacity(0.5)
        case .red25:
            return Color.red.opacity(0.25)
        case .orange25:
            return Color.orange.opacity(0.25)
        case .yellow25:
            return Color.yellow.opacity(0.25)
        case .green25:
            return Color.green.opacity(0.25)
        case .mint25:
            return Color.mint.opacity(0.25)
        case .teal25:
            return Color.teal.opacity(0.25)
        case .cyan25:
            return Color.cyan.opacity(0.25)
        case .blue25:
            return Color.blue.opacity(0.25)
        case .indigo25:
            return Color.indigo.opacity(0.25)
        case .purple25:
            return Color.purple.opacity(0.25)
        case .pink25:
            return Color.pink.opacity(0.25)
        case .brown25:
            return Color.brown.opacity(0.25)
        }
    }
}
