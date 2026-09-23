//
//  SegmentedControlItemTagEnvironmentValues.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var segmentedControlItemTag: AnyHashable?
}

extension View {

    func segmentedControlItemTag(_ value: AnyHashable?) -> some View {
        self.environment(\.segmentedControlItemTag, value)
    }
}
