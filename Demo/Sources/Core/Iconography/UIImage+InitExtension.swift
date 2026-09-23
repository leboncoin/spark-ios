//
//  UIImage+InitExtension.swift
//  Resources
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit

extension UIImage {

    convenience init(icon iconography: Iconography) {
        self.init(spark: iconography.keyPath)
    }

    convenience init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}
