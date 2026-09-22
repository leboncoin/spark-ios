//
//  SnackbarIntentEnvironmentValues.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var snackbarIntent: SnackbarIntent = .default
}

public extension View {

    /// Set the **intent** on the Snackbar.
    ///
    /// The default value for this property is *SnackbarIntent.default*.
    func sparkSnackbarIntent(_ intent: SnackbarIntent) -> some View {
        self.environment(\.snackbarIntent, intent)
    }
}
