//
//  SparkUIButtonStyle.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 20/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// A protocol that defines the visual appearance of a ``SparkUIButton``.
///
/// Conform to this protocol to create custom button styles that modify only the design
/// and visual presentation of Spark buttons without altering their behavior or functionality.
///
/// Use the `init` with *style* parameter to apply your custom style to a button:
///
/// ```swift
/// let button = SparkUIButton(theme: theme, style: MyCustomButtonStyle())
/// ```
public protocol SparkUIButtonStyle {
    /// Apply the style on the button passed in parameter.
    func apply(on button: SparkUIButton)
}
