//
//  TextFieldAddonConfigurationEnvironmentValues.swift
//  SparkComponentTextInput
//
//  Created by robin.lemaire on 04/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textFieldLeftAddonConfiguration: TextFieldAddonConfiguration = .init()
    @Entry var textFieldRightAddonConfiguration: TextFieldAddonConfiguration = .init()
}

public extension View {

    /// Add a **configuration** properties on **left addon**  on the ``SparkTextField``.
    ///
    /// - Parameters:
    ///   - hasPadding: Add a padding or not on the addon. Default is **false**.
    ///   - hasSeparator: Add a separator on the addon. Default is **false**.
    ///   - layoutPriority: The layout priority of the addon. Default is **1**.
    func sparkTextFieldLeftAddonConfiguration(
        hasPadding: Bool = false,
        hasSeparator: Bool = false,
        layoutPriority: CGFloat = 1.0
    ) -> some View {
        let configuration = TextFieldAddonConfiguration(
            hasPadding: hasPadding,
            hasSeparator: hasSeparator,
            layoutPriority: layoutPriority
        )

        return self.environment(\.textFieldLeftAddonConfiguration, configuration)
    }

    /// Add a **configuration** properties on **right addon**  on the ``SparkTextField``.
    ///
    /// - Parameters:
    ///   - hasPadding: Add a padding or not on the addon. Default is **false**.
    ///   - hasSeparator: Add a separator on the addon. Default is **false**.
    ///   - layoutPriority: The layout priority of the addon. Default is **1**.
    func sparkTextFieldRightAddonConfiguration(
        hasPadding: Bool = false,
        hasSeparator: Bool = false,
        layoutPriority: CGFloat = 1.0
    ) -> some View {
        let configuration = TextFieldAddonConfiguration(
            hasPadding: hasPadding,
            hasSeparator: hasSeparator,
            layoutPriority: layoutPriority
        )

        return self.environment(\.textFieldRightAddonConfiguration, configuration)
    }
}
