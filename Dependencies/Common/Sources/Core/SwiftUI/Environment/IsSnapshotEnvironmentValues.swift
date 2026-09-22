//
//  IsSnapshotEnvironmentValues.swift
//  SparkCommon
//
//  Created by robin.lemaire on 26/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming
import SwiftUI

public extension EnvironmentValues {
    @Entry var isSnapshot: Bool = false
}

public extension View {

    /// Set the **isSnapshot** EnvironmentValues.
    /// Can be usefull to disabled animation on snapshots testing.
    ///
    /// Note : *MUST BE ONLY USED ON THE **SnapshotTesting** folder*
    ///
    /// The default value is *false*.
    @ViewBuilder
    func sparkIsSnapshot(_ isSnapshot: Bool) -> some View {
        self.environment(\.isSnapshot, isSnapshot)
    }
}
