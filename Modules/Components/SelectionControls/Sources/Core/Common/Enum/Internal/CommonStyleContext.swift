//
//  CommonStyleContext.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum CommonStyleContext: Equatable {
    case alone
    case group(axis: SelectionControlsAxis)

    // MARK: - Properties

    /// The default case. Equals to **.alone**.
    static let `default`: Self = .alone
}
