//
//  SegmentedControlItemIsSelectedEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlItemIsSelected: Bool = false
}

extension View {

    func segmentedControlItemIsSelected(_ value: Bool) -> some View {
        self.environment(\.segmentedControlItemIsSelected, value)
    }
}
