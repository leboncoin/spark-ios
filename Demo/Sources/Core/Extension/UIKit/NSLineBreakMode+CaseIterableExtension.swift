//
//  NSLineBreakMode+CaseIterableExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension NSLineBreakMode: @retroactive CaseIterable, @retroactive CustomStringConvertible {

    public static var allCases: [NSLineBreakMode] = [
        .byWordWrapping,
        .byTruncatingHead,
        .byTruncatingMiddle,
        .byTruncatingTail,
    ]

    public var description: String {
        switch self {
        case .byWordWrapping: "By Word Wrapping"
        case .byTruncatingHead: "By Truncating Head"
        case .byTruncatingMiddle: "By Truncating Middle"
        case .byTruncatingTail: "By Truncating Tail"
        default: ""
        }
    }
}
