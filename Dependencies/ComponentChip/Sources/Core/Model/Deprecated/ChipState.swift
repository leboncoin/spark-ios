//
//  ChipState.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 21.08.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Not used anymore by SparkChip")
struct ChipState {

    static let `default` = ChipState(isEnabled: true, isPressed: false, isSelected: false)

    let isEnabled: Bool
    let isPressed: Bool
    let isSelected: Bool

    var isDisabled: Bool {
        return !self.isEnabled
    }
}
