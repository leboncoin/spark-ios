//
//  TextFieldSideViewContentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum TextFieldSideViewContentType: String, CaseIterable {
    case none
    case button
    case image
    case text

    // MARK: - Properties

    var isEmptyView: Bool {
        self == .none
    }
}
