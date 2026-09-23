//
//  StepperConstants.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentButton

enum StepperConstants {
    static let textMinWidth: CGFloat = 48
    static let trackingInterval: TimeInterval = 0.5

    enum IconButton {
        static let intent: ButtonIntent = .support
        static let variant: ButtonVariant = .outlined
        static let size: ButtonSize = .medium
        static let shape: ButtonShape = .rounded // TODO: Remove
    }
}
