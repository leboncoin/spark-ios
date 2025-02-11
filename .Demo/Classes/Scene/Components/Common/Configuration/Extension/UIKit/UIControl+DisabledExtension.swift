//
//  UIControl+DisabledExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit

extension UIControl {

    func demoDisabled<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.isEnabled = configuration.isEnabled.value
    }
}
