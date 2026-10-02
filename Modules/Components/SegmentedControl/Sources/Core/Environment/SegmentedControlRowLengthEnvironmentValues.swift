//
//  SegmentedControlRowLengthEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 02/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlRowLength: Int = 4
}

public extension View {

    /// Set the **row length** (maximum number of items per line) on the SegmentedControl.
    ///
    /// - If the value is **0**, all items are displayed on a single line.
    /// - If the value is **1 or more**, items are split into lines containing at most this number of items.
    ///
    /// The default value for this property is *4*.
    func sparkSegmentedControlRowLength(_ rowLength: Int) -> some View {
        self.environment(\.segmentedControlRowLength, rowLength)
    }
}
