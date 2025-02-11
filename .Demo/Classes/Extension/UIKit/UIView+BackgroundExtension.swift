//
//  UIView+BackgroundExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
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

    // TODO:
//    func demoComponentInfoBackground() {
//        self.font(.footnote)
//            .padding(.all, .small)
//            .background(.ultraThinMaterial)
//            .radius(.medium)
//    }
}

