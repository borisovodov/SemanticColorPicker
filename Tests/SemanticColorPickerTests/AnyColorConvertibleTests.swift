import SwiftUI
import Testing
@testable import SemanticColorPicker

@Suite struct AnyColorConvertibleTests {
    enum CustomColor: String, ColorConvertible, Identifiable, CaseIterable {
        case customRed = "customRed"
        case customBlue = "customBlue"
        case customGreen = "customGreen"
        
        var id: String { rawValue }
        
        var color: Color {
            switch self {
            case .customRed:
                return Color(red: 0.8, green: 0.2, blue: 0.2)
            case .customBlue:
                return Color(red: 0.2, green: 0.2, blue: 0.8)
            case .customGreen:
                return Color(red: 0.2, green: 0.8, blue: 0.2)
            }
        }
        
        var description: String {
            switch self {
            case .customRed:
                return "Custom Red"
            case .customBlue:
                return "Custom Blue"
            case .customGreen:
                return "Custom Green"
            }
        }
    }
    
    @Test func anyColorConvertibleWrapsSemanticColor() {
        let semanticColor = SemanticColor.blue
        let wrapped = AnyColorConvertible(semanticColor)
        
        #expect(wrapped.description == semanticColor.description)
        #expect(wrapped.color == semanticColor.color)
    }
    
    @Test func anyColorConvertibleWrapsCustomColor() {
        let customColor = CustomColor.customRed
        let wrapped = AnyColorConvertible(customColor)
        
        #expect(wrapped.description == customColor.description)
        #expect(wrapped.color == customColor.color)
        #expect(wrapped.rawValue == customColor.rawValue)
    }
    
    @Test func combiningDifferentColorTypes() {
        let allColors: [AnyColorConvertible] =
            [SemanticColor.red, SemanticColor.blue, SemanticColor.green].map { AnyColorConvertible($0) } +
            CustomColor.allCases.map { AnyColorConvertible($0) }
        
        #expect(allColors.count == 6)
        #expect(allColors[0].description == SemanticColor.red.description)
        #expect(allColors[3].description == CustomColor.customRed.description)
    }
    
    @Test func equality() {
        let color1 = AnyColorConvertible(SemanticColor.red)
        let color2 = AnyColorConvertible(SemanticColor.red)
        let color3 = AnyColorConvertible(SemanticColor.blue)
        
        #expect(color1 == color2)
        #expect(color1 != color3)
    }
    
    @Test func hashable() {
        let color1 = AnyColorConvertible(SemanticColor.red)
        let color2 = AnyColorConvertible(SemanticColor.red)
        let color3 = AnyColorConvertible(SemanticColor.blue)
        
        var set = Set<AnyColorConvertible>()
        set.insert(color1)
        set.insert(color2)
        set.insert(color3)
        
        #expect(set.count == 2)
    }
    
    @Test func codable() throws {
        let original = AnyColorConvertible(SemanticColor.purple)
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(AnyColorConvertible.self, from: data)
        
        #expect(decoded.description == original.description)
        #expect(decoded.rawValue == original.rawValue)
    }
    
    @Test func codableWithCustomColor() throws {
        let original = AnyColorConvertible(CustomColor.customBlue)
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(AnyColorConvertible.self, from: data)
        
        #expect(decoded.description == original.description)
        #expect(decoded.rawValue == original.rawValue)
        #expect(decoded.color == .clear)
    }
    
    @Test func initWithExplicitId() {
        struct NonIdentifiableColor: ColorConvertible {
            let color: Color
            let description: String
        }
        
        let customColor = NonIdentifiableColor(color: .red, description: "My Red")
        let wrapped = AnyColorConvertible(customColor, id: "my-red-id")
        
        #expect(wrapped.description == "My Red")
        #expect(wrapped.id == AnyHashable("my-red-id"))
    }
}
