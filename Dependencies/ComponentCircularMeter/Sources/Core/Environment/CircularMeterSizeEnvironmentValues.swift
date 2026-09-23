//
//  CircularMeterSizeEnvironmentValues.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var circularMeterSize: CircularMeterSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkCircularMeter``.
    ///
    /// The default value for this property is *CircularMeterSize.default*.
    func sparkCircularMeterSize(_ size: CircularMeterSize) -> some View {
        self.environment(\.circularMeterSize, size)
    }
}
