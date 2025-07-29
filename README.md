# SemanticColorPicker

A SwiftUI component that lets you select semantic color tokens—custom identifiers that map to adaptive, theme-aware `Color` values—instead of picking raw RGB colors.

[![Latest release](https://img.shields.io/github/v/release/borisovodov/SemanticColorPicker)](https://github.com/borisovodov/SemanticColorPicker/releases)
[![Build and test status](https://github.com/borisovodov/SemanticColorPicker/actions/workflows/workflow.yaml/badge.svg)](https://github.com/borisovodov/SemanticColorPicker/actions/workflows/workflow.yaml)
[![Swift versions](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fborisovodov%2FSemanticColorPicker%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/borisovodov/SemanticColorPicker)
[![Available platforms](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fborisovodov%2FSemanticColorPicker%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/borisovodov/SemanticColorPicker)

## Overview

`SemanticColorPicker` is a SwiftUI control that displays a color well for a selected semantic color token and provides a grid-based selector for choosing from a predefined set of tokens. Unlike SwiftUI’s native `ColorPicker`, this package binds to types conforming to `ColorConvertible`, enabling theme-aware, environment-adaptive colors across iOS, macOS, and watchOS.

Package also contains:
* `ColorConvertible` protocol, which allows you to define custom color types that can be used with the `SemanticColorPicker`.
* A default implementation of `ColorConvertible` using the `SemanticColor` enum, which includes common semantic colors like `.red`, `.blue`, etc., and their opacity variants.

## Installation

Add next row in your `Package.swift` file `dependencies` section:

```swift
.package(url: "https://github.com/borisovodov/SemanticColorPicker.git", from: "0.1.0")
```

Alternatively you can add package dependency in Xcode. For that open `.xcproject` file → click `PROJECT` → `Package Dependencies` → `+` → type `https://github.com/borisovodov/SemanticColorPicker` in the search field → click `Add Package`. See the Xcode [documentation](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app) for details.

Then import the package:

```swift
import SemanticColorPicker
```

## Usage

Use `SemanticColorPicker` in your SwiftUI view:

```swift
import SwiftUI
import SemanticColorPicker

struct ThemeSettingsView: View {
    @State private var selectedColor: SemanticColor = .blue

    var body: some View {
        SemanticColorPicker("Accent Color", data: SemanticColor.allCases, selection: $selectedColor)
            .padding()
    }
}
```

Or with a custom data type:

```swift
struct Tag: Identifiable, ColorConvertible {
    let id: UUID = UUID()
    let color: Color
    let description: String
}

let tags: [Tag] = [
    .init(color: Color.red, description: "Red"),
    .init(color: Color.blue, description: "Blue"),
    .init(color: Color.green, description: "Green")
]

struct ContentView: View {
    @State private var selectedTag: Tag = tags[0]

    var body: some View {
        SemanticColorPicker(data: tags, selection: $selectedTag) {
            Text("Select Tag Color")
        }
        .padding()
    }
}
```
