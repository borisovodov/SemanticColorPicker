import SwiftUI

/// A type with a color representation.
public protocol ColorConvertible: CustomStringConvertible, Equatable, Codable {
    
    /// A color representation of this instance.
    var color: Color { get }
}
