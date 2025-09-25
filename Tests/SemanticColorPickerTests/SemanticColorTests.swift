import SwiftUI
import Testing
@testable import SemanticColorPicker

@Suite struct SemanticColorTests {
    @Test func describe() async throws {
        #expect(String(describing: SemanticColor.red) == String(localized: "redColorSelection"))
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
}
