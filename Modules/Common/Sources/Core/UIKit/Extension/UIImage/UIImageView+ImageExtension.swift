//
//  UIImageView+ImageExtension.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

@_spi(SI_SPI) public extension UIImageView {

    /// Set a image in ImageView.
    /// This func hide the view if the image is nil.
    func image(_ value: UIImage?) {
        self.isHidden = value == nil
        self.image = value
    }
}
