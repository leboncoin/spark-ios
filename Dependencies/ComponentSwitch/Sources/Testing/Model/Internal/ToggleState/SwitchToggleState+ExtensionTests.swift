//
//  SwitchToggleState.swift
//  SparkComponentSwitch
//
//  Created by robin.lemaire on 24/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@testable import SparkComponentSwitch

extension SwitchToggleState {

    // MARK: - Properties

    static func mocked(
        interactionEnabled: Bool = true,
        opacity: CGFloat = 1.0
    ) -> Self {
        return .init(
            interactionEnabled: interactionEnabled,
            opacity: opacity
        )
    }
}
