//
//  ButtonRemoveStylesEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonRemoveStyles: Bool = false
}

public extension View {

    /// Remove the styles (*border*, *radius*, *height*, ...) on the Button.
    ///
    /// Is usefull if the button is an addon on **SparkTextField**.
    ///
    /// The default value for this property is *false*.
    func sparkButtonRemoveStyles(_ removeStyles: Bool) -> some View {
        self.environment(\.buttonRemoveStyles, removeStyles)
    }
}
