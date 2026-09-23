//
//  UILabel+TextExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UILabel {

    /// Set a text in Label.
    /// This func set to nil the attributedText and hide the label if the text is nil
    func text(_ value: String?) {
        self.isHidden = value == nil
        self.attributedText = nil
        self.text = value
    }

    /// Set a attributedText in Label.
    /// This func set to nil the text and hide the label if the text is nil
    func attributedText(_ value: NSAttributedString?) {
        self.isHidden = value == nil
        self.text = nil
        self.attributedText = value
    }
}
