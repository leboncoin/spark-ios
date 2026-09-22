//
//  TabTagsPreferenceKey.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 27/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

struct TabTagsPreferenceKey: PreferenceKey {

    // MARK: - Properties

    static var defaultValue: [AnyHashable] = []

    // MARK: - Methods

    static func reduce(value: inout [AnyHashable], nextValue: () -> [AnyHashable]) {
        value.append(contentsOf: nextValue())
    }
}
