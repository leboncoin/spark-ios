//
//  LimitedScaledMetric+InitExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 31/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon

extension LimitedScaledMetric {

    init(value: CGFloat) {
        let scaled = CommonConstants.Scaled.self
        self.init(
            value: value,
            minFactor: scaled.minFactor,
            maxFactor: scaled.maxFactor
        )
    }
}
