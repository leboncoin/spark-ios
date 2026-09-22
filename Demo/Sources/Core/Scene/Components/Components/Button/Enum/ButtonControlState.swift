//
//  ButtonControlState.swift
//  SparkDemo
//
//  Created by robin.lemaire on 14/04/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import UIKit

enum ButtonControlState: String, CaseIterable {
    case normal
    case highlighted
    case disabled
    case selected

    // MARK: - Properties

    var toUIControlState: UIControl.State {
        switch self {
        case .normal: .normal
        case .highlighted: .highlighted
        case .disabled: .disabled
        case .selected: .selected
        }
    }
}
