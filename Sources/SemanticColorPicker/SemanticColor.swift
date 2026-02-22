import SwiftUI

/// An extensible structure of semantic colors conforming to the `ColorConvertible` protocol.
///
/// This struct provides a comprehensive set of standard colors and their opacity variants (75%, 50%, and 25%)
/// as static properties. It is identifiable, equatable, hashable, and convertible to a SwiftUI `Color`, 
/// furnishing a localized description for display.
///
/// Developers can create custom colors by initializing new instances with their own identifiers, descriptions, and colors.
/// Use this struct as the data source for `SemanticColorPicker` to present a predefined palette of semantic colors
/// or extend it with custom colors.
///
/// Example of creating custom colors and using them with `SemanticColorPicker`:
/// ```swift
/// extension SemanticColor {
///     static let gray = SemanticColor(
///         id: "gray",
///         description: "Gray Color",
///         color: .gray
///     )
/// }
///
/// struct ContentView: View {
///     @State private var selectedColor: SemanticColor = .blue
///     
///     // Combine standard colors with custom ones
///     let palette = SemanticColor.allCases + [
///         SemanticColor.gray,
///     ]
///     
///     var body: some View {
///         SemanticColorPicker("Color", data: palette, selection: $selectedColor)
///     }
/// }
/// ```
public struct SemanticColor: Sendable, Identifiable, ColorConvertible, Equatable, Hashable {
    /// The unique identifier for this color, fulfilling `Identifiable`.
    public let id: String
    
    /// A localized text description for the color, suitable for accessibility and display.
    public let description: String
    
    /// A SwiftUI `Color` representation of this semantic color.
    public let color: Color
    
    /// Creates a new semantic color with the specified identifier, description, and color.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the color.
    ///   - description: A localized text description for accessibility and display.
    ///   - color: The SwiftUI `Color` representation.
    public init(id: String, description: String, color: Color) {
        self.id = id
        self.description = description
        self.color = color
    }
    
    // MARK: - Predefined Colors
    
    public static let red = SemanticColor(
        id: "red",
        description: String(localized: "redColorSelection", bundle: .module),
        color: .red
    )
    
    public static let orange = SemanticColor(
        id: "orange",
        description: String(localized: "orangeColorSelection", bundle: .module),
        color: .orange
    )
    
    public static let yellow = SemanticColor(
        id: "yellow",
        description: String(localized: "yellowColorSelection", bundle: .module),
        color: .yellow
    )
    
    public static let green = SemanticColor(
        id: "green",
        description: String(localized: "greenColorSelection", bundle: .module),
        color: .green
    )
    
    public static let mint = SemanticColor(
        id: "mint",
        description: String(localized: "mintColorSelection", bundle: .module),
        color: .mint
    )
    
    public static let teal = SemanticColor(
        id: "teal",
        description: String(localized: "tealColorSelection", bundle: .module),
        color: .teal
    )
    
    public static let cyan = SemanticColor(
        id: "cyan",
        description: String(localized: "cyanColorSelection", bundle: .module),
        color: .cyan
    )
    
    public static let blue = SemanticColor(
        id: "blue",
        description: String(localized: "blueColorSelection", bundle: .module),
        color: .blue
    )
    
    public static let indigo = SemanticColor(
        id: "indigo",
        description: String(localized: "indigoColorSelection", bundle: .module),
        color: .indigo
    )
    
    public static let purple = SemanticColor(
        id: "purple",
        description: String(localized: "purpleColorSelection", bundle: .module),
        color: .purple
    )
    
    public static let pink = SemanticColor(
        id: "pink",
        description: String(localized: "pinkColorSelection", bundle: .module),
        color: .pink
    )
    
    public static let brown = SemanticColor(
        id: "brown",
        description: String(localized: "brownColorSelection", bundle: .module),
        color: .brown
    )
    
    // MARK: - 75% Opacity Variants
    
    public static let red75 = SemanticColor(
        id: "red75",
        description: String(localized: "redColorSelection75", bundle: .module),
        color: .red.opacity(0.75)
    )
    
    public static let orange75 = SemanticColor(
        id: "orange75",
        description: String(localized: "orangeColorSelection75", bundle: .module),
        color: .orange.opacity(0.75)
    )
    
    public static let yellow75 = SemanticColor(
        id: "yellow75",
        description: String(localized: "yellowColorSelection75", bundle: .module),
        color: .yellow.opacity(0.75)
    )
    
    public static let green75 = SemanticColor(
        id: "green75",
        description: String(localized: "greenColorSelection75", bundle: .module),
        color: .green.opacity(0.75)
    )
    
    public static let mint75 = SemanticColor(
        id: "mint75",
        description: String(localized: "mintColorSelection75", bundle: .module),
        color: .mint.opacity(0.75)
    )
    
    public static let teal75 = SemanticColor(
        id: "teal75",
        description: String(localized: "tealColorSelection75", bundle: .module),
        color: .teal.opacity(0.75)
    )
    
    public static let cyan75 = SemanticColor(
        id: "cyan75",
        description: String(localized: "cyanColorSelection75", bundle: .module),
        color: .cyan.opacity(0.75)
    )
    
    public static let blue75 = SemanticColor(
        id: "blue75",
        description: String(localized: "blueColorSelection75", bundle: .module),
        color: .blue.opacity(0.75)
    )
    
    public static let indigo75 = SemanticColor(
        id: "indigo75",
        description: String(localized: "indigoColorSelection75", bundle: .module),
        color: .indigo.opacity(0.75)
    )
    
    public static let purple75 = SemanticColor(
        id: "purple75",
        description: String(localized: "purpleColorSelection75", bundle: .module),
        color: .purple.opacity(0.75)
    )
    
    public static let pink75 = SemanticColor(
        id: "pink75",
        description: String(localized: "pinkColorSelection75", bundle: .module),
        color: .pink.opacity(0.75)
    )
    
    public static let brown75 = SemanticColor(
        id: "brown75",
        description: String(localized: "brownColorSelection75", bundle: .module),
        color: .brown.opacity(0.75)
    )
    
    // MARK: - 50% Opacity Variants
    
    public static let red50 = SemanticColor(
        id: "red50",
        description: String(localized: "redColorSelection50", bundle: .module),
        color: .red.opacity(0.5)
    )
    
    public static let orange50 = SemanticColor(
        id: "orange50",
        description: String(localized: "orangeColorSelection50", bundle: .module),
        color: .orange.opacity(0.5)
    )
    
    public static let yellow50 = SemanticColor(
        id: "yellow50",
        description: String(localized: "yellowColorSelection50", bundle: .module),
        color: .yellow.opacity(0.5)
    )
    
    public static let green50 = SemanticColor(
        id: "green50",
        description: String(localized: "greenColorSelection50", bundle: .module),
        color: .green.opacity(0.5)
    )
    
    public static let mint50 = SemanticColor(
        id: "mint50",
        description: String(localized: "mintColorSelection50", bundle: .module),
        color: .mint.opacity(0.5)
    )
    
    public static let teal50 = SemanticColor(
        id: "teal50",
        description: String(localized: "tealColorSelection50", bundle: .module),
        color: .teal.opacity(0.5)
    )
    
    public static let cyan50 = SemanticColor(
        id: "cyan50",
        description: String(localized: "cyanColorSelection50", bundle: .module),
        color: .cyan.opacity(0.5)
    )
    
    public static let blue50 = SemanticColor(
        id: "blue50",
        description: String(localized: "blueColorSelection50", bundle: .module),
        color: .blue.opacity(0.5)
    )
    
    public static let indigo50 = SemanticColor(
        id: "indigo50",
        description: String(localized: "indigoColorSelection50", bundle: .module),
        color: .indigo.opacity(0.5)
    )
    
    public static let purple50 = SemanticColor(
        id: "purple50",
        description: String(localized: "purpleColorSelection50", bundle: .module),
        color: .purple.opacity(0.5)
    )
    
    public static let pink50 = SemanticColor(
        id: "pink50",
        description: String(localized: "pinkColorSelection50", bundle: .module),
        color: .pink.opacity(0.5)
    )
    
    public static let brown50 = SemanticColor(
        id: "brown50",
        description: String(localized: "brownColorSelection50", bundle: .module),
        color: .brown.opacity(0.5)
    )
    
    // MARK: - 25% Opacity Variants
    
    public static let red25 = SemanticColor(
        id: "red25",
        description: String(localized: "redColorSelection25", bundle: .module),
        color: .red.opacity(0.25)
    )
    
    public static let orange25 = SemanticColor(
        id: "orange25",
        description: String(localized: "orangeColorSelection25", bundle: .module),
        color: .orange.opacity(0.25)
    )
    
    public static let yellow25 = SemanticColor(
        id: "yellow25",
        description: String(localized: "yellowColorSelection25", bundle: .module),
        color: .yellow.opacity(0.25)
    )
    
    public static let green25 = SemanticColor(
        id: "green25",
        description: String(localized: "greenColorSelection25", bundle: .module),
        color: .green.opacity(0.25)
    )
    
    public static let mint25 = SemanticColor(
        id: "mint25",
        description: String(localized: "mintColorSelection25", bundle: .module),
        color: .mint.opacity(0.25)
    )
    
    public static let teal25 = SemanticColor(
        id: "teal25",
        description: String(localized: "tealColorSelection25", bundle: .module),
        color: .teal.opacity(0.25)
    )
    
    public static let cyan25 = SemanticColor(
        id: "cyan25",
        description: String(localized: "cyanColorSelection25", bundle: .module),
        color: .cyan.opacity(0.25)
    )
    
    public static let blue25 = SemanticColor(
        id: "blue25",
        description: String(localized: "blueColorSelection25", bundle: .module),
        color: .blue.opacity(0.25)
    )
    
    public static let indigo25 = SemanticColor(
        id: "indigo25",
        description: String(localized: "indigoColorSelection25", bundle: .module),
        color: .indigo.opacity(0.25)
    )
    
    public static let purple25 = SemanticColor(
        id: "purple25",
        description: String(localized: "purpleColorSelection25", bundle: .module),
        color: .purple.opacity(0.25)
    )
    
    public static let pink25 = SemanticColor(
        id: "pink25",
        description: String(localized: "pinkColorSelection25", bundle: .module),
        color: .pink.opacity(0.25)
    )
    
    public static let brown25 = SemanticColor(
        id: "brown25",
        description: String(localized: "brownColorSelection25", bundle: .module),
        color: .brown.opacity(0.25)
    )
    
    // MARK: - Collection
    
    /// An array containing all predefined semantic colors.
    public static let allCases: [SemanticColor] = [
        .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown,
        .red75, .orange75, .yellow75, .green75, .mint75, .teal75, .cyan75, .blue75, .indigo75, .purple75, .pink75, .brown75,
        .red50, .orange50, .yellow50, .green50, .mint50, .teal50, .cyan50, .blue50, .indigo50, .purple50, .pink50, .brown50,
        .red25, .orange25, .yellow25, .green25, .mint25, .teal25, .cyan25, .blue25, .indigo25, .purple25, .pink25, .brown25
    ]
    
    /// Returns a random `SemanticColor` value from the predefined palette.
    public static var random: SemanticColor {
        Self.allCases.randomElement() ?? .yellow
    }
    
    // MARK: - Palette Support
    
    /// A coding user info key for providing a custom color palette during encoding and decoding.
    ///
    /// When encoding or decoding `SemanticColor` instances, you can provide a custom palette
    /// that includes additional colors beyond the predefined ones. This allows custom colors
    /// to be properly decoded instead of falling back to a default gray color.
    ///
    /// Example:
    /// ```swift
    /// let customPalette = SemanticColor.allCases + [.customColor1, .customColor2]
    /// let encoder = JSONEncoder()
    /// encoder.userInfo[SemanticColor.paletteKey] = customPalette
    ///
    /// let decoder = JSONDecoder()
    /// decoder.userInfo[SemanticColor.paletteKey] = customPalette
    /// ```
    public static let paletteKey: CodingUserInfoKey = {
        guard let key = CodingUserInfoKey(rawValue: "com.semanticcolorpicker.palette") else {
            fatalError("Failed to create CodingUserInfoKey with the specified raw value")
        }
        return key
    }()
}

// MARK: - Codable

extension SemanticColor: Codable {
    /// Errors that can occur during `SemanticColor` decoding.
    public enum DecodingError: Error, LocalizedError {
        case colorNotFound(id: String)
        
        public var errorDescription: String? {
            switch self {
            case .colorNotFound(let id):
                return "SemanticColor with id '\(id)' not found in the provided palette or predefined colors. Ensure the color is included in the palette passed via encoder/decoder userInfo."
            }
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let id = try container.decode(String.self)
        
        // First, try to find in the custom palette provided via userInfo
        if let palette = decoder.userInfo[Self.paletteKey] as? [SemanticColor],
           let found = palette.first(where: { $0.id == id }) {
            self = found
            return
        }
        
        // Fall back to predefined colors
        if let predefined = Self.allCases.first(where: { $0.id == id }) {
            self = predefined
            return
        }
        
        // If not found anywhere, throw an error
        throw DecodingError.colorNotFound(id: id)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(id)
    }
}
