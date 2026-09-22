//
//  ButtonIsLoadingEnvironmentValues.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 13/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var buttonIsLoading: Bool = false
}

public extension View {

    /// Set the **loading state** on the Button.
    ///
    /// The default value for this property is *false*.
    func sparkButtonIsLoading(_ isLoading: Bool) -> some View {
        self.environment(\.buttonIsLoading, isLoading)
    }
}
