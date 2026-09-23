//
//  AdaptiveStack.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// A stack view that adapts its layout based on accessibility font size settings
///
/// Implementation example :
/// ```swift
/// struct MyView: View {
///     var body: some View {
///         AdaptiveStack(
///             axis: .horizontal,
///             alignment: .bottom,
///             spacing: 8,
///             accessibilityAlignment: .trailing,
///             accessibilitySpacing: 16,
///             accessibilitySizeClass: .compact
///         ) {
///             Text("Hello")
///             Text("Bye")
///         }
///     }
/// }
/// ```
public struct SparkAdaptiveStack<Content: View>: View {

    // MARK: - Enums

    /// Define Axis enum to match UIKit's NSLayoutConstraint.Axis
    public enum Axis {
        /// Horizontal implements a HStack
        case horizontal
        /// Vertical implements a HStack
        case vertical

        internal var accessibilityAxis: Self {
            switch self {
            case .horizontal: .vertical
            case .vertical: .horizontal
            }
        }
    }

    // MARK: - Properties

    // Environment value to detect accessibility settings
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    // Configuration for regular size category
    private let axis: Axis
    private let alignment: Alignment
    private let spacing: CGFloat?

    // Configuration for accessibility size category
    private let accessibilityAlignment: Alignment
    private let accessibilitySpacing: CGFloat?
    private let accessibilitySizeClass: UserInterfaceSizeClass?
    private let showAccessibilityStack: Bool?

    // Content to display
    @ViewBuilder private let content: () -> Content

    // MARK: - Initialization

    /// Initializes an adaptive stack that changes layout based on accessibility settings
    /// - Parameters:
    ///   - axis: The axis to use for regular size categories (default: horizontal)
    ///   - alignment: The alignment to use for regular size categories (default: center)
    ///   - spacing: The spacing to use for regular size categories (default: nil)
    ///   - accessibilityAlignment: The alignment to use for accessibility size categories (default: center)
    ///   - accessibilitySpacing: The spacing to use for accessibility size categories. If nil, the spacing of the stack will use the spacing parameter value (default: nil)
    ///   - accessibilitySizeClass: Use the accessibility stack only for if the screen size class is equals to this value or if the value is nil. (default: nil)
    ///   - content: The view builder that creates the content
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     var body: some View {
    ///         AdaptiveStack(
    ///             axis: .horizontal,
    ///             alignment: .bottom,
    ///             spacing: 8,
    ///             accessibilityAlignment: .trailing,
    ///             accessibilitySpacing: 16,
    ///             accessibilitySizeClass: .compact
    ///         ) {
    ///             Text("Hello")
    ///             Text("Bye")
    ///         }
    ///     }
    /// }
    /// ```
    public init(
        axis: Axis = .horizontal,
        alignment: Alignment = .center,
        spacing: CGFloat? = nil,
        accessibilityAlignment: Alignment = .center,
        accessibilitySpacing: CGFloat? = nil,
        accessibilitySizeClass: UserInterfaceSizeClass? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
        self.accessibilityAlignment = accessibilityAlignment
        self.accessibilitySpacing = accessibilitySpacing
        self.accessibilitySizeClass = accessibilitySizeClass
        self.showAccessibilityStack = nil
        self.content = content
    }

    /// Initializes an adaptive stack that changes from your own rules (by *showAccessibilityStack* parameter)
    /// - Parameters:
    ///   - axis: The axis to use for regular size categories (default: horizontal)
    ///   - alignment: The alignment to use for regular size categories (default: center)
    ///   - spacing: The spacing to use for regular size categories (default: nil)
    ///   - accessibilityAlignment: The alignment to use for accessibility size categories (default: center)
    ///   - accessibilitySpacing: The spacing to use for accessibility size categories. If nil, the spacing of the stack will use the spacing parameter value (default: nil)
    ///   - showAccessibilityStack: The custom visibility of the accessibility stack. If false, the regular stack will be displayed. If true, the accessibility stack will be displayed
    ///   - content: The view builder that creates the content
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     var body: some View {
    ///         AdaptiveStack(
    ///             axis: .horizontal,
    ///             alignment: .bottom,
    ///             spacing: 8,
    ///             accessibilityAlignment: .trailing,
    ///             accessibilitySpacing: 16,
    ///             showAccessibilityStack: false
    ///         ) {
    ///             Text("Hello")
    ///             Text("Bye")
    ///         }
    ///     }
    /// }
    /// ```
    public init(
        axis: Axis = .horizontal,
        alignment: Alignment = .center,
        spacing: CGFloat? = nil,
        accessibilityAlignment: Alignment = .center,
        accessibilitySpacing: CGFloat? = nil,
        showAccessibilityStack: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
        self.accessibilityAlignment = accessibilityAlignment
        self.accessibilitySpacing = accessibilitySpacing
        self.accessibilitySizeClass = nil
        self.showAccessibilityStack = showAccessibilityStack
        self.content = content
    }

    // MARK: - View

    public var body: some View {
        if self.isAccessibilityStack() {
            // Use accessibility configuration
            switch self.axis.accessibilityAxis {
            case .horizontal:
                HStack(
                    alignment: self.accessibilityAlignment.vertical, spacing: self.accessibilitySpacing ?? self.spacing, content: self.content)
            case .vertical:
                VStack(alignment: self.accessibilityAlignment.horizontal, spacing: self.accessibilitySpacing ?? self.spacing, content: self.content)
            }
        } else {
            // Use regular configuration
            switch self.axis {
            case .horizontal:
                HStack(alignment: self.alignment.vertical, spacing: self.spacing, content: self.content)
            case .vertical:
                VStack(alignment: self.alignment.horizontal, spacing: self.spacing, content: self.content)
            }
        }
    }

    // MARK: - Getter

    func isAccessibilityStack() -> Bool {
        return if let showAccessibilityStack {
            showAccessibilityStack
        } else {
            self.dynamicTypeSize.isAccessibilitySize && (self.accessibilitySizeClass == nil || self.horizontalSizeClass == self.accessibilitySizeClass)
        }
    }
}
