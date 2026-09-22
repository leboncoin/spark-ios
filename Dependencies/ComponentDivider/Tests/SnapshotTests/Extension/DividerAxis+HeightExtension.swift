//
//  DividerAxis+HeightExtension.swift
//  SparkComponentDividerSnapshotTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentDivider
import Foundation

extension DividerAxis {

    var width: CGFloat {
        switch self {
        case .horizontal: 320
        case .vertical: 130
        }
    }

    var height: CGFloat {
        switch self {
        case .horizontal: 50
        case .vertical: 200
        }
    }
}
