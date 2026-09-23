//
//  ButtonShapeEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonShape: ButtonShape = .default
}

public extension View {

    /// Set the **alignment** on the Button.
    ///
    /// The default value for this property is *ButtonShape.default*.
    func sparkButtonShape(_ alignment: ButtonShape) -> some View {
        self.environment(\.buttonShape, alignment)
    }
}
