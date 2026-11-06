//
//  SegmentedControlToken+ScaleEffect.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Scale Effect

public extension SegmentedControlToken {

    /// Contains the theme-independent scale effect values of the SegmentedControl.
    struct ScaleEffect: Equatable {

        // MARK: - Methods

        /// The scale effect of an item. Only an enabled pressed item is scaled.
        public func item(isPressed: Bool, isEnabled: Bool) -> CGFloat {
            return isPressed && isEnabled ? 1.05 : 1.0
        }
    }
}
