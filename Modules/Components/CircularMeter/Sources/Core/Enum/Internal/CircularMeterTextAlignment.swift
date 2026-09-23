//
//  CircularMeterTextAlignment.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI

/// The text alignment of the circular meter.
enum CircularMeterTextAlignment {
    /// Leading text alignment
    case leading

    /// Center text alignment
    case center

    // MARK: - Properties

    /// The default case. Equals to **.leading**.
    static let `default`: Self = .leading

    var swiftUIAlignement: HorizontalAlignment {
        switch self {
        case .leading: .leading
        case .center: .center
        }
    }
}
