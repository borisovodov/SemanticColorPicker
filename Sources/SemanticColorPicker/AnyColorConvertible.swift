import SwiftUI

/// A type-erased wrapper for any value conforming to `ColorConvertible`.
///
/// Use `AnyColorConvertible` to combine different color types in a single collection
/// for use with `SemanticColorPicker`. This is particularly useful when you want to
/// extend `SemanticColor` with your own custom colors.
///
/// Example:
/// ```swift
/// enum GrayColor: String, Sendable, CaseIterable, Identifiable, ColorConvertible, Codable {
///     case gray
///     case gray75
///     case gray50
///     case gray25
///
///     var id: String { rawValue }
/// 
///     var color: Color {
///         switch self {
///             case .gray: .gray
///             case .gray75: .gray.opacity(0.75)
///             case .gray50: .gray.opacity(0.5)
///             case .gray25: .gray.opacity(0.25)
///         }
///     }
/// 
///     var description: String {
///         switch self {
///             case .gray: "Gray"
///             case .gray75: "Gray 75%"
///             case .gray50: "Gray 50%"
///             case .gray25: "Gray 25%"
///         }
///     }
/// }
///
/// let allColors: [AnyColorConvertible] =
///     SemanticColor.allCases.map { AnyColorConvertible($0) } +
///     GrayColor.allCases.map { AnyColorConvertible($0) }
/// 
/// ...
/// 
/// @State private var selectedColor: AnyColorConvertible = AnyColorConvertible(SemanticColor.red)
/// 
/// SemanticColorPicker("Color", data: allColors, selection: $selectedColor)
/// ```
public struct AnyColorConvertible: ColorConvertible, Identifiable, Hashable, Codable {
    private let _color: Color
    private let _description: String
    private let _id: AnyHashable
    private let _rawValue: String?
    
    /// The unique identifier for this color.
    public var id: AnyHashable { _id }
    
    /// A color representation of this instance.
    public var color: Color { _color }
    
    /// A textual description of this instance.
    public var description: String { _description }
    
    /// The optional raw value, if the wrapped type has one.
    public var rawValue: String? { _rawValue }
    
    /// Creates a type-erased color convertible wrapper.
    ///
    /// - Parameter colorConvertible: A value conforming to `ColorConvertible` and `Identifiable`.
    public init<T: ColorConvertible & Identifiable>(_ colorConvertible: T) where T.ID: Hashable {
        self._color = colorConvertible.color
        self._description = colorConvertible.description
        self._id = AnyHashable(colorConvertible.id)
        
        // Try to extract raw value if the type has one
        if let rawRepresentable = colorConvertible as? any RawRepresentable,
           let stringValue = rawRepresentable.rawValue as? String {
            self._rawValue = stringValue
        } else {
            self._rawValue = nil
        }
    }
    
    /// Creates a type-erased color convertible wrapper with an explicit identifier.
    ///
    /// - Parameters:
    ///   - colorConvertible: A value conforming to `ColorConvertible`.
    ///   - id: A hashable identifier for this color.
    public init<T: ColorConvertible, ID: Hashable>(_ colorConvertible: T, id: ID) {
        self._color = colorConvertible.color
        self._description = colorConvertible.description
        self._id = AnyHashable(id)
        
        // Try to extract raw value if the type has one
        if let rawRepresentable = colorConvertible as? any RawRepresentable,
           let stringValue = rawRepresentable.rawValue as? String {
            self._rawValue = stringValue
        } else {
            self._rawValue = nil
        }
    }
    
    // MARK: - Equatable
    
    public static func == (lhs: AnyColorConvertible, rhs: AnyColorConvertible) -> Bool {
        lhs._id == rhs._id && lhs._description == rhs._description
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
        hasher.combine(_description)
    }
    
    // MARK: - Codable
    
    private enum CodingKeys: String, CodingKey {
        case description
        case id
        case rawValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._description = try container.decode(String.self, forKey: .description)
        self._rawValue = try container.decodeIfPresent(String.self, forKey: .rawValue)
        
        // Try to decode as SemanticColor if rawValue is present
        if let rawValue = _rawValue,
           let semanticColor = SemanticColor(rawValue: rawValue) {
            self._color = semanticColor.color
            self._id = AnyHashable(semanticColor.id)
        } else {
            // Fallback: cannot reconstruct the original color, use clear color
            self._color = Color.clear
            let idString = try container.decode(String.self, forKey: .id)
            self._id = AnyHashable(idString)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_description, forKey: .description)
        try container.encode("\(_id)", forKey: .id)
        try container.encodeIfPresent(_rawValue, forKey: .rawValue)
    }
}
