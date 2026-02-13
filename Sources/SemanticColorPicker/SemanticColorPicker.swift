import SwiftUI
#if os(iOS)
import UIKit
#endif

/// A view that displays a color well for the currently selected semantic color token,
/// and presents a grid of predefined semantic colors for selection.
/// Unlike the default `ColorPicker`, this control binds to an identifier or token
/// conforming to `ColorConvertible`, enabling theme-aware and environment-adaptive
/// colors (e.g., light/dark mode variants).
///
/// Example:
/// ```swift
/// struct ThemeSettingsView: View {
///     @State private var selectedColor: SemanticColor = .blue
///
///     var body: some View {
///         SemanticColorPicker("Accent Color", data: SemanticColor.allCases, selection: $selectedColor)
///     }
/// }
/// ```
///
/// The binding provides a semantic token that you can use throughout your UI,
/// automatically adapting its underlying `Color` in different contexts.
@available(iOS 17.0, macOS 14.0, watchOS 11.0, visionOS 2.0, tvOS 17.0, *)
public struct SemanticColorPicker<Label, Data, ID> : View where Label : View, Data: RandomAccessCollection, Data.Element: ColorConvertible, ID: Hashable {
    private var data: Data
    private var dataID: KeyPath<Data.Element, ID>
    private var selection: Binding<Data.Element>
    private var label: Label

    @State private var isPresented: Bool = false

    /// The content and behavior of the view.
    public var body: some View {
        let arrowEdge: Edge = {
#if os(macOS)
            return .bottom
#else
            return .trailing
#endif
        }()

        LabeledContent {
            self.selectedOption
#if os(macOS) || os(iOS) || os(visionOS)
                .popover(isPresented: $isPresented, arrowEdge: arrowEdge) {
                    self.selector
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
#endif
        } label: {
            self.label
        }
#if os(watchOS) ||  os(tvOS)
        .onTapGesture {
            self.open()
        }
        .sheet(isPresented: $isPresented) {
            self.selector
        }
#endif
    }

    @ViewBuilder private var selectedOption: some View {
        let circleSize: CGFloat = {
#if os(macOS) || os(watchOS)
            return 28
#else
            if UIDevice.current.userInterfaceIdiom == .pad {
                return 36
            } else {
                return 28
            }
#endif
        }()


        ColorCircle(color: selection.wrappedValue, size: circleSize) {
            self.open()
        }
        .overlay(
            Circle()
                .strokeBorder(.background, lineWidth: 5)
                .strokeBorder(
                    AngularGradient(
                        gradient: Gradient(colors: [.red, .purple, .blue, .cyan, .green, .yellow, .orange, .red]),
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)
                    ),
                    lineWidth: 3
                )
        )
    }

    @ViewBuilder private var selector: some View {
#if os(macOS) || os(visionOS)
        self.valuesGrid
#else
        ScrollView {
            self.valuesGrid
        }
#endif
    }

#if os(watchOS)
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
    ]
#else
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
        GridItem(.adaptive(minimum: 28, maximum: 100), spacing: 16),
    ]
#endif

    @ViewBuilder private var valuesGrid: some View {
        let circleSize: CGFloat = {
#if os(macOS) || os(watchOS)
            return 28
#else
            return 42
#endif
        }()

        LazyVGrid(columns: self.columns, spacing: 16) {
            ForEach(self.data, id: dataID) { storedColor in
                ColorCircle(color: storedColor, size: circleSize) {
                    self.selection.wrappedValue = storedColor
                    self.close()
                }
                .overlay(
                    Circle()
#if os(visionOS)
                        .strokeBorder(.background, lineWidth: storedColor == self.selection.wrappedValue ? 5 : 0)
#else
                        .strokeBorder(.windowBackground, lineWidth: storedColor == self.selection.wrappedValue ? 5 : 0)
#endif
                        .strokeBorder(.primary, lineWidth: storedColor == self.selection.wrappedValue ? 3 : 0)
                )
            }
        }
        .padding()
    }

    private func open() {
        self.isPresented = true
    }

    private func close() {
        self.isPresented = false
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 11.0, visionOS 2.0, tvOS 17.0, *)
extension SemanticColorPicker where Data.Element: Identifiable, ID == Data.Element.ID {

    /// Initialize a semantic color picker with a custom label view.
    ///
    /// - Parameters:
    ///   - data: A collection of semantic color tokens conforming to `ColorConvertible` to display.
    ///   - selection: A `Binding` to the currently selected token from the data collection.
    ///   - label: A view builder that provides the label describing the purpose of the picker.
    public init(data: Data, selection: Binding<Data.Element>, @ViewBuilder label: () -> Label) {
        self.data = data
        self.dataID = \.id
        self.selection = selection
        self.label = label()
    }

    /// Initialize a semantic color picker with a localized text label.
    ///
    /// - Parameters:
    ///   - titleKey: The localized string key used as the picker's text label.
    ///   - data: A collection of semantic color tokens to display.
    ///   - selection: A `Binding` to the currently selected token.
    public init(_ titleKey: LocalizedStringKey, data: Data, selection: Binding<Data.Element>) where Label == Text {
        self.data = data
        self.dataID = \.id
        self.selection = selection
        self.label = Text(titleKey)
    }

    /// Initialize a semantic color picker with a plain text label.
    ///
    /// - Parameters:
    ///   - title: The string used as the picker's text label.
    ///   - data: A collection of semantic color tokens to display.
    ///   - selection: A `Binding` to the currently selected token.
    public init<S>(_ title: S, data: Data, selection: Binding<Data.Element>) where S : StringProtocol, Label == Text {
        self.data = data
        self.dataID = \.id
        self.selection = selection
        self.label = Text(title)
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 11.0, visionOS 2.0, tvOS 17.0, *)
extension SemanticColorPicker {

    /// Initialize a semantic color picker with an explicit identifier key path and custom label view.
    ///
    /// - Parameters:
    ///   - data: A collection of semantic color tokens conforming to `ColorConvertible` to display.
    ///   - id: A key path to the identifier property on each data element.
    ///   - selection: A `Binding` to the currently selected token.
    ///   - label: A view builder that provides the label describing the purpose of the picker.
    public init(data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Data.Element>, @ViewBuilder label: () -> Label) {
        self.data = data
        self.dataID = id
        self.selection = selection
        self.label = label()
    }

    /// Initialize a semantic color picker with an explicit identifier key path and a localized text label.
    ///
    /// - Parameters:
    ///   - titleKey: The localized string key used as the picker's text label.
    ///   - data: A collection of semantic color tokens to display.
    ///   - id: A key path to the identifier property on each data element.
    ///   - selection: A `Binding` to the currently selected token.
    public init(_ titleKey: LocalizedStringKey, data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Data.Element>) where Label == Text {
        self.data = data
        self.dataID = id
        self.selection = selection
        self.label = Text(titleKey)
    }

    /// Initialize a semantic color picker with an explicit identifier key path and a plain text label.
    ///
    /// - Parameters:
    ///   - title: The string used as the picker's text label.
    ///   - data: A collection of semantic color tokens to display.
    ///   - id: A key path to the identifier property on each data element.
    ///   - selection: A `Binding` to the currently selected token.
    public init<S>(_ title: S, data: Data, id: KeyPath<Data.Element, ID>, selection: Binding<Data.Element>) where S : StringProtocol, Label == Text {
        self.data = data
        self.dataID = id
        self.selection = selection
        self.label = Text(title)
    }
}

@available(iOS 17.0, macOS 14.0, watchOS 11.0, visionOS 2.0, tvOS 17.0, *)
private struct ColorCircle: View {
    private var color: any ColorConvertible
    private var size: CGFloat
    private var action: () -> Void

    init(color: any ColorConvertible, size: CGFloat = 28, onTap action: @escaping () -> Void) {
        self.color = color
        self.size = size
        self.action = action
    }

    var body: some View {
        Circle()
            .frame(width: self.size, height: self.size)
            .foregroundStyle(self.color.color)
            .onTapGesture { self.action() }
            .accessibilityLabel(self.color.description)
    }
}
