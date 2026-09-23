//
//  AvatarSource.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum AvatarSource: String, CaseIterable {
    case url
    case image

    // MARK: - Properties

    static let `default`: Self = .image
}
