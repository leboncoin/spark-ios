//
//  UIView+BackgroundExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIView {

    func demoBackground(
        _ configuration: ComponentConfiguration
    ) {
        if configuration.isInvertedBackground() {
            self.backgroundColor = .gray.withAlphaComponent(0.2)
        }
    }
}
