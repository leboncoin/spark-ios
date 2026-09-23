//
//  NSAttributedString+InitExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 12/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension NSAttributedString {

    static func snapshot() -> Self {
        .init(
            string: "Welcome\non Spark's selection controls",
            attributes: [
                .foregroundColor: UIColor.red,
                .font: UIFont.italicSystemFont(ofSize: 20),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
    }
}
