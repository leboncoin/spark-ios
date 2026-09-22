//
//  SegmentedControlLayoutEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlLayout = SegmentedControlLayout()
}

extension View {

    func segmentedControlLayout(_ value: SegmentedControlLayout) -> some View {
        self.environment(\.segmentedControlLayout, value)
    }
}
