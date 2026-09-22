//
//  SnackbarAlignmentEnvironmentValues.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var snackbarAlignment: SnackbarAlignment = .default
}

public extension View {

    /// Set the **alignment** on the Snackbar.
    ///
    /// The default value for this property is *SnackbarAlignment.default*.
    func sparkSnackbarAlignment(_ alignment: SnackbarAlignment) -> some View {
        self.environment(\.snackbarAlignment, alignment)
    }
}
