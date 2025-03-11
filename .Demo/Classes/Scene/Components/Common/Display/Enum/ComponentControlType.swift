//
//  ComponentControlType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

/// Used only for the UIKit components.
enum ComponentControlType: String, CaseIterable {
    case publisher
    case action
    case target
    case toggle // Only for the button
}
