//
//  ScaledFrame.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SwiftUI

@propertyWrapper internal struct ScaledFrame: DynamicProperty {

    // MARK: - Public Properties

    var wrappedValue: CGFloat? {
        get {
            self.value >= 0 ? self.value : nil
        }
    }

    // MARK: - Private Properties

    @ScaledMetric private var value: CGFloat

    // MARK: - Initialization

    init(value: CGFloat?, relativeTo: Font.TextStyle?) {
        let value = value ?? -1
        if let relativeTo {
            self._value = .init(wrappedValue: value, relativeTo: relativeTo)
        } else {
            self._value = .init(wrappedValue: value)
        }
    }
}
