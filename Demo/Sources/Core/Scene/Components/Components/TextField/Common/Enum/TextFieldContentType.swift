//
//  TextFieldContentType.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

enum TextFieldContentType: String, CaseIterable {
    case text
    case number
    case formattedNumber
    case currency

    // MARK: - Properties

    var isText: Bool {
        self == .text
    }
}
