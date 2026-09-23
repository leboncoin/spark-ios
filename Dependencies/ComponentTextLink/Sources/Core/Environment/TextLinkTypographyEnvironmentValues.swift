//
//  TextLinkTypographyEnvironmentValues.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textLinkTypography: TextLinkTypography = .default
}

public extension View {

    /// Set the **typography** on the ``SparkTextLink``.
    ///
    /// The default value for this property is *TextLinkTypography.default*.
    func sparkTextLinkTypography(_ typography: TextLinkTypography) -> some View {
        self.environment(\.textLinkTypography, typography)
    }
}
