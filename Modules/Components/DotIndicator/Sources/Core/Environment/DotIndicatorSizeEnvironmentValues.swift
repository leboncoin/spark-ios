//
//  DotIndicatorSizeEnvironmentValues.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var dotIndicatorSize: DotIndicatorSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkDotIndicator``.
    ///
    /// The default value for this property is *DotIndicatorSize.default*.
    ///
    /// > Note: Only the **large** size can have the tap interaction.
    func sparkDotIndicatorSize(_ size: DotIndicatorSize) -> some View {
        self.environment(\.dotIndicatorSize, size)
    }
}
