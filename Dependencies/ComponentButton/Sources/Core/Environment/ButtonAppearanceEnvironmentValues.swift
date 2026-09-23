//
//  ButtonAppearanceEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 17/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    // TODO: Must be equals to .default when the Intent and Variant are deleted ASAP (25/07/26)
    @Entry var buttonAppearance: ButtonAppearance?
}

public extension View {

    /// Set the **appearance** on the Button.
    ///
    /// The default value for this property is *ButtonAppearance.default*.
    func sparkButtonAppearance(_ appearance: ButtonAppearance) -> some View {
        self.environment(\.buttonAppearance, appearance)
    }
}
