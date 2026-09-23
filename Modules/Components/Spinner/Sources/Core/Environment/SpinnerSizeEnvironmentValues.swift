//
//  SpinnerSizeEnvironmentValues.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var spinnerSize: SpinnerSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkSpinner``.
    ///
    /// The default value for this property is *SpinnerSize.default*.
    func sparkSpinnerSize(_ size: SpinnerSize) -> some View {
        self.environment(\.spinnerSize, size)
    }
}
