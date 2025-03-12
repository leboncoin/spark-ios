//
//  NSTextAlignment+CaseIterableExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension NSTextAlignment: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static var allCases: [NSTextAlignment] = [
        .left,
        .center,
        .right,
        .justified,
        .natural
    ]

    public var description: String {
        switch self {
        case .left: "Left"
        case .center: "Center"
        case .right: "Right"
        case .justified: "Justified"
        case .natural: "Natural"
        default: ""
        }
    }
}
