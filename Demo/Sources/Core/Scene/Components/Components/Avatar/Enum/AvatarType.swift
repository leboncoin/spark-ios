//
//  AvatarType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum AvatarType: String, CaseIterable {
    case user
    case company

    // MARK: - Properties

    static let `default`: Self = .user
}
