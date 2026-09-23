//
//  LimitedScaledUIMetric+InitExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 04/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon

extension LimitedScaledUIMetric {

    init(wrappedValue: CGFloat) {
        let scaled = CommonConstants.Scaled.self
        self.init(
            wrappedValue: wrappedValue,
            minFactor: scaled.minFactor,
            maxFactor: scaled.maxFactor
        )
    }
}
