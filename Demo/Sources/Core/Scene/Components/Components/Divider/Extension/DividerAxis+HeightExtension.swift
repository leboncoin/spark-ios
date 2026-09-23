//
//  DividerAxis+HeightExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension DividerAxis {

    var height: CGFloat {
        switch self {
        case .horizontal: 50
        case .vertical: 200
        }
    }
}
