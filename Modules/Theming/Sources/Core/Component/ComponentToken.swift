//
//  ComponentToken.swift
//  SparkTheming
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Theme

public extension Theme {

    /// The component tokens derived from the theme.
    var component: ComponentToken {
        return .init(theme: self)
    }
}

// MARK: - Component Token

/// Namespace extended by each component module to expose its tokens.
public struct ComponentToken {

    // MARK: - Properties

    public let theme: any Theme

    // MARK: - Initialization

    public init(theme: any Theme) {
        self.theme = theme
    }
}
