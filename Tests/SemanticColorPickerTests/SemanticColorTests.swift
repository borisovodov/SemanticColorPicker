import SwiftUI
import Testing
@testable import SemanticColorPicker

@Suite struct SemanticColorTests {
    @Test func describe() async throws {
        #expect(String(describing: SemanticColor.red) == String(localized: "redColorSelection", bundle: .module))
    }
    
    @Test func random() async throws {
        #expect(SemanticColor.random != SemanticColor.red ||
                SemanticColor.random != SemanticColor.red ||
                SemanticColor.random != SemanticColor.red ||
                SemanticColor.random != SemanticColor.red
        )
    }
    
    @Test func color() async throws {
        #expect(SemanticColor.red.color == Color.red)
    }
    
    @Test func codablePredefinedColor() async throws {
        // Test encoding and decoding a predefined color
        let original = SemanticColor.blue
        let encoder = JSONEncoder()
        let data = try encoder.encode(original)
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(SemanticColor.self, from: data)
        
        #expect(decoded.id == original.id)
        #expect(decoded.description == original.description)
        #expect(decoded.color == original.color)
    }
    
    @Test func codableCustomColorWithPalette() async throws {
        // Create a custom color
        let customColor = SemanticColor(
            id: "customEmerald",
            description: "Custom Emerald",
            color: Color(red: 0.31, green: 0.78, blue: 0.47)
        )
        
        // Create a custom palette
        let customPalette = SemanticColor.palette(including: [customColor])
        
        // Encode with palette
        let encoder = JSONEncoder()
        encoder.userInfo[SemanticColor.paletteKey] = customPalette
        let data = try encoder.encode(customColor)
        
        // Decode with palette
        let decoder = JSONDecoder()
        decoder.userInfo[SemanticColor.paletteKey] = customPalette
        let decoded = try decoder.decode(SemanticColor.self, from: data)
        
        // Verify the custom color was properly decoded
        #expect(decoded.id == customColor.id)
        #expect(decoded.description == customColor.description)
        #expect(decoded.color == customColor.color)
    }
    
    @Test func codableCustomColorWithoutPaletteThrowsError() async throws {
        // Create a custom color
        let customColor = SemanticColor(
            id: "unknownColor",
            description: "Unknown Color",
            color: .purple
        )
        
        // Encode without palette
        let encoder = JSONEncoder()
        let data = try encoder.encode(customColor)
        
        // Decode without palette (should throw error)
        let decoder = JSONDecoder()
        
        #expect(throws: SemanticColor.DecodingError.self) {
            try decoder.decode(SemanticColor.self, from: data)
        }
    }
    
    @Test func paletteIncludingMethod() async throws {
        let custom1 = SemanticColor(id: "custom1", description: "Custom 1", color: .cyan)
        let custom2 = SemanticColor(id: "custom2", description: "Custom 2", color: .mint)
        
        let palette = SemanticColor.palette(including: [custom1, custom2])
        
        // Verify palette contains all predefined colors plus custom ones
        #expect(palette.count == SemanticColor.allCases.count + 2)
        #expect(palette.contains(where: { $0.id == "custom1" }))
        #expect(palette.contains(where: { $0.id == "custom2" }))
        #expect(palette.contains(where: { $0.id == "red" }))
    }
}

