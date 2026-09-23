//
//  IsSelectedEnvironmentValues.swift
//  SparkCommon
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

public extension EnvironmentValues {
    @Entry var isSelected: Bool = false
}

public extension View {

    /// Set the **isSelected** on some Spark component.
    ///
    /// The default value for this property is *false*.
    func sparkIsSelected(_ value: Bool) -> some View {
        self.environment(\.isSelected, value)
    }
}
