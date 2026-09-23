//
//  NSLayoutConstraint+ActivatedExtension.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 17/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    /// Activate constraint and set a new constant value.
    func activatedConstants(_ constant: CGFloat) {
        self.constant = constant
        self.isActive = true
    }
}
