//
//  Image+InitExtension.swift
//  Resources
//
//  Created by robin.lemaire on 17/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension Image {

    init(icon iconography: Iconography) {
        self.init(spark: iconography.keyPath)
    }

    init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}
