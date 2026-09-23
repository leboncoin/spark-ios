//
//  SparkButtonImage.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 16/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A wrapper view for button images that ensures proper sizing and rendering.
///
/// Use `SparkButtonImage` when you need to provide a custom image view to ``SparkButton``
/// with custom animations or effects. This view automatically applies the correct aspect ratio
/// and resizing behavior for button icons.
///
/// ## Example of usage
///
/// ### Basic Usage
///
/// ```swift
/// SparkButton(
///     "Save",
///     action: { }
/// ) {
///     SparkButtonImage(image: Image(systemName: "checkmark"))
/// }
/// ```
///
/// ### With Animation
///
/// ```swift
/// struct MyView: View {
///     @State private var scale: CGFloat = 1.0
///
///     var body: some View {
///         SparkButton(
///             "Animate",
///             action: {
///                 withAnimation {
///                     self.scale = 1.5
///                 }
///             }
///         ) {
///             SparkButtonImage(image: Image(systemName: "star.fill"))
///                 .scaleEffect(self.scale)
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
/// ### With Rotation Effect
///
/// ```swift
/// struct MyView: View {
///     @State private var rotation: Double = 0
///
///     var body: some View {
///         SparkButton(
///             action: {
///                 withAnimation {
///                     self.rotation += 180
///                 }
///             }
///         ) {
///             SparkButtonImage(image: Image(systemName: "arrow.clockwise"))
///                 .rotationEffect(.degrees(self.rotation))
///         }
///         .sparkTheme(self.theme)
///     }
/// }
/// ```
///
public struct SparkButtonImage: View {

    // MARK: - Properties

    let image: Image

    // MARK: - Initialization

    /// Creates a button image view.
    ///
    /// - Parameter image: The image to display in the button.
    public init(image: Image) {
        self.image = image
    }

    // MARK: - View

    public var body: some View {
        self.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
