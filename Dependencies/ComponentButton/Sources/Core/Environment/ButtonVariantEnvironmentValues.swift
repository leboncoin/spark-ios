//
//  ButtonVariantEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonVariant: ButtonVariant = .default
}

public extension View {

    /// Set the **variant** on the Button.
    ///
    /// The default value for this property is *ButtonVariant.default*.
    func sparkButtonVariant(_ variant: ButtonVariant) -> some View {
        self.environment(\.buttonVariant, variant)
    }
}
