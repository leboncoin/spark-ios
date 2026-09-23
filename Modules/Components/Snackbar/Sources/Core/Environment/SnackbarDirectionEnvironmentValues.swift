//
//  SnackbarDirectionEnvironmentValues.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var snackbarDirection: SnackbarDirection = .default
}

public extension View {

    /// Set the **direction** on the Snackbar.
    ///
    /// The default value for this property is *SnackbarDirection.default*.
    func sparkSnackbarDirection(_ direction: SnackbarDirection) -> some View {
        self.environment(\.snackbarDirection, direction)
    }
}
