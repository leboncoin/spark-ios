//
//  ButtonIntentEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonIntent: ButtonIntent = .default
}

public extension View {

    /// Set the **intent** on the Button.
    ///
    /// The default value for this property is *ButtonIntent.default*.
    func sparkButtonIntent(_ intent: ButtonIntent) -> some View {
        self.environment(\.buttonIntent, intent)
    }
}
