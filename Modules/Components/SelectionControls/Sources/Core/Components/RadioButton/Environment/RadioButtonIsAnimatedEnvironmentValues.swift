//
//  RadioButtonIsAnimatedEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 01/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var radioButtonIsAnimated: Bool = true
}

public extension View {

    /// Play an animation when the selection changed on the ``SparkRadioButton``.
    ///
    /// The default value for this property is *true*.
    ///
    /// **Note** : Can be usefull if the radio button is on a sheet and if selection changed close the sheet.
    func sparkRadioButtonIsAnimated(_ isAnimated: Bool) -> some View {
        self.environment(\.radioButtonIsAnimated, isAnimated)
    }
}
