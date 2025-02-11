//
//  Iconography.swift
//  SparkDemo
//
//  Created by robin.lemaire on 16/01/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import SwiftUI
import UIKit

enum Iconography: String, CaseIterable {
    case arrowRight = "ArrowRight"
    case bellOutline = "BellOutline"
    case check = "Check"
    case cross = "Cross"
    case infoOutline = "InfoOutline"
    case warningFill = "WarningFill"
}

// MARK: - SwiftUI Extensions

extension Image {

    init(icon iconography: Iconography) {
        self.init(iconography.rawValue)
    }

    init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}

extension UIImage {

    convenience init(icon iconography: Iconography) {
        self.init(named: iconography.rawValue)!
    }

    convenience init?(icon iconography: Iconography?) {
        guard let iconography else {
            return nil
        }

        self.init(icon: iconography)
    }
}
