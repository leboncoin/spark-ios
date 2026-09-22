//
//  TextFieldAddon.swift
//  SparkTextField
//
//  Created by louis.borlee on 21/03/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

/// Single TextFieldAddon embedding a Content View
@available(*, deprecated, message: "With SparkTextField, this view key is no longer usefull.")
public struct TextFieldAddon<Content: View>: View {

    // MARK: - Properties

    let withPadding: Bool
    let layoutPriority: Double
    private let content: () -> Content

    // MARK: - Initialization

    /// TextFieldAddon initializer
    /// - Parameters:
    ///   - withPadding: Add addon padding if `true`, default is `false`
    ///   - layoutPriority: Set addon .layoutPriority(), default is `1.0`
    ///   - content: Addon's content View
    public init(
        withPadding: Bool = false,
        layoutPriority: Double = 1.0,
        content: @escaping () -> Content) {
        self.withPadding = withPadding
        self.layoutPriority = layoutPriority
        self.content = content
    }

    // MARK: - View

    public var body: Content {
        self.content()
    }
}
