//
//  ButtonBorder.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentButton

extension ButtonBorder {

    // MARK: - Properties

    static func mocked(
        width: CGFloat = 2,
        radius: CGFloat = 8
    ) -> Self {
        return .init(
            width: width,
            radius: radius
        )
    }
}
