//
//  UIStackView+AlignmentExtension.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 08/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIStackView {

    func alignment(textInArrangedSubviews text: String?) {
        self.alignment = text == nil ? .fill : .firstBaseline
    }

    func alignment(attributedTextInArrangedSubviews attributedText: NSAttributedString?) {
        self.alignment(textInArrangedSubviews: attributedText?.string)
    }
}
