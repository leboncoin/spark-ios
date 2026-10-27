//
//  SegmentedControlToken+Opacity.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Opacity

public extension SegmentedControlToken {

    /// Contains the opacity token values of the SegmentedControl.
    struct Opacity: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The opacity of the segmented control.
        public func value(isEnabled: Bool) -> CGFloat {
            let dims = self.theme.dims

            return isEnabled ? dims.none : dims.dim3
        }

        // MARK: - Equatable

        public static func == (lhs: Opacity, rhs: Opacity) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
