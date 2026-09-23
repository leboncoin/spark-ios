//
//  ButtonHasFeedbackEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonHasFeedback: Bool = false
}

public extension View {

    /// Add a the **feedback** on the Button if the value is *true*.
    ///
    /// The default value for this property is *false*.
    func sparkButtonHasFeedback(_ hasFeedback: Bool) -> some View {
        self.environment(\.buttonHasFeedback, hasFeedback)
    }
}
