//
//  String+AttributedStringExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension String {

    var demoAttributedString: AttributedString {
        var attributedText = AttributedString(self)
        attributedText.font = DemoThemes.shared.mainTheme.value.typography.body2.font
        attributedText.foregroundColor = .red
        attributedText.backgroundColor = .gray
        return attributedText
    }

    var demoNSAttributedString: NSAttributedString {
        return .init(
            string: self,
            attributes: [
                .foregroundColor: UIColor.red,
                .font: UIFont.italicSystemFont(ofSize: 20),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
    }
}
