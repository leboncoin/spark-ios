//
//  ButtonAlignmentEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonAlignment: ButtonAlignment = .default
}

public extension View {

    /// Set the **alignment** on the Button.
    ///
    /// The default value for this property is *ButtonAlignment.default*.
    func sparkButtonAlignment(_ alignment: ButtonAlignment) -> some View {
        self.environment(\.buttonAlignment, alignment)
    }
}
