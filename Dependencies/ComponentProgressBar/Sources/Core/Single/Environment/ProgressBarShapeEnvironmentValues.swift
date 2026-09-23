//
//  ProgressBarShapeEnvironmentValues.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var progressBarShape: ProgressBarShape = .default
}

public extension View {

    /// Set the **shape** on the ``SparkProgressBar``.
    ///
    /// The default value for this property is *ProgressBarShape.default*.
    func sparkProgressBarShape(_ shape: ProgressBarShape) -> some View {
        self.environment(\.progressBarShape, shape)
    }
}
