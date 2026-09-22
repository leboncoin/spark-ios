//
//  String+RandomSystemImageExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    private static let systemImages = [
        "trash",
        "folder",
        "paperplane",
        "tray",
        "externaldrive",
        "internaldrive",
        "archivebox",
        "doc",
        "clipboard",
        "terminal",
        "book",
        "greetingcard",
        "menucard",
        "magazine"
    ]

    static func tabRandomSystemImage(at index: Int) -> String {
        let allSfs: [String] = Self.systemImages.flatMap{ [$0, "\($0).fill"] }
        return allSfs[index % Self.systemImages.count]
    }
}
