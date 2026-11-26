//
//  DotsIndicatorSizeEnvironmentValues.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dotsIndicatorSize: DotsIndicatorSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkDotsIndicator``.
    ///
    /// The default value for this property is *DotsIndicatorSize.default*.
    ///
    /// > Note: Only the **large** size can have the tap interaction.
    func sparkDotsIndicatorSize(_ size: DotsIndicatorSize) -> some View {
        self.environment(\.dotsIndicatorSize, size)
    }
}
