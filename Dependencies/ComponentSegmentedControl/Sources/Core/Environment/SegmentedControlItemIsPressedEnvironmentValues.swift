//
//  SegmentedControlItemIsPressedEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlItemIsPressed: Bool = false
}

extension View {

    func segmentedControlItemIsPressed(_ value: Bool) -> some View {
        self.environment(\.segmentedControlItemIsPressed, value)
    }
}
