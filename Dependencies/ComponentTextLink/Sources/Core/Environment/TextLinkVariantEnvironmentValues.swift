//
//  TextLinkVariantEnvironmentValues.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textLinkVariant: TextLinkVariant = .default
}

public extension View {

    /// Set the **variant** on the ``SparkTextLink``.
    ///
    /// The default value for this property is *TextLinkVariant.default*.
    func sparkTextLinkVariant(_ variant: TextLinkVariant) -> some View {
        self.environment(\.textLinkVariant, variant)
    }
}
