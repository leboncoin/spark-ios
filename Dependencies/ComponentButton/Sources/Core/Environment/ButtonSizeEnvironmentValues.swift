//
//  ButtonSizeEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonSize: ButtonSize = .default
}

public extension View {

    /// Set the **size** on the Button.
    ///
    /// The default value for this property is *ButtonSize.default*.
    func sparkButtonSize(_ size: ButtonSize) -> some View {
        self.environment(\.buttonSize, size)
    }
}
