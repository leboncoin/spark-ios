//
//  SliderConstants.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum SliderConstants {
    static let thumbWidth: CGFloat = {
        if #available(iOS 26.0, *) {
            38
        } else {
            28
        }
    }()
}
