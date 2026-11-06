//
//  SegmentedControlDisabledPreferenceKey.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 06/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// Collects the tags of the disabled items (`.disabled(true)` set on a ``SparkSegmentedControlItem``).
struct SegmentedControlDisabledPreferenceKey: PreferenceKey {

    // MARK: - Properties

    static var defaultValue: Set<AnyHashable> = []

    // MARK: - Methods

    static func reduce(value: inout Set<AnyHashable>, nextValue: () -> Set<AnyHashable>) {
        value.formUnion(nextValue())
    }
}
