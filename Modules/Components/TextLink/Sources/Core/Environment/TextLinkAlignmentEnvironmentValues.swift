//
//  TextLinkAlignmentEnvironmentValues.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textLinkAlignment: TextLinkAlignment = .default
}

public extension View {

    /// Set the **alignment** on the ``SparkTextLink``.
    ///
    /// The default value for this property is *TextLinkAlignment.default*.
    func sparkTextLinkAlignment(_ alignment: TextLinkAlignment) -> some View {
        self.environment(\.textLinkAlignment, alignment)
    }
}
