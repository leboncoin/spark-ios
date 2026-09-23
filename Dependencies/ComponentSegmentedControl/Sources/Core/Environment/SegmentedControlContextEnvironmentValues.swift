//
//  SegmentedControlContextEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlContext: SegmentedControlContext = .collecting
}

extension View {

    func segmentedControlContext(_ value: SegmentedControlContext) -> some View {
        self.environment(\.segmentedControlContext, value)
    }
}
