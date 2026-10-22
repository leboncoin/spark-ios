//
//  OpacityRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 21/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

extension Theme {

    // MARK: - Getter

    func opacity(isEnabled: Bool) -> CGFloat {
        return isEnabled ? self.dims.none : self.dims.dim3
    }
}
